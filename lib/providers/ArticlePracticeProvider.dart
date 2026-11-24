import 'package:flutter/foundation.dart';
import 'package:stelinda/models/ArticlePractice.dart';
import 'package:stelinda/services/ArticlePracticeService.dart';

enum ArticlePracticeStatus {
  loading,
  locked,
  playing,
  checking,
  correct,
  wrong,
  complete,

  /// Patikanın Artikel adımı hedefe vardı: "Artikel tamam!".
  stepComplete,
  error,
}

class ArticlePracticeProvider extends ChangeNotifier {
  ArticlePracticeProvider(this._service);

  static const int _maxCompletedTaskRetries = 4;

  final ArticlePracticeService _service;
  ArticlePracticeStatus status = ArticlePracticeStatus.loading;
  ArticlePracticeTask? task;
  ArticlePracticeTask? nextTask;
  ArticlePracticeAnswer? answerResult;
  int learnedWordCount = 0;
  int requiredWordCount = 2;

  bool get canInteract => status == ArticlePracticeStatus.playing;

  /// Oynanan Artikel adımının ünitesi (sırası); yan duraktan açıldıysa null.
  int? _unit;
  int? get unit => _unit;

  /// Artikel adımının ilerlemesi; sunucudan her yanıtta gelir.
  ArticleStepProgress? step;

  /// Oyunu patikanın bir Artikel adımı için kurar (ya da yan durak için
  /// sıfırlar). Hazırlanan görevden önce çağrılır.
  void configure({int? unit}) {
    _unit = unit;
    step = null;
  }

  /// Son doğru cevapla adım hedefe vardı: oyun bitiş ekranına geçer.
  bool get stepJustCompleted =>
      _unit != null &&
      answerResult?.isCorrect == true &&
      answerResult?.step?.completed == true;

  void finishStep() {
    status = ArticlePracticeStatus.stepComplete;
    notifyListeners();
  }

  Future<void>? _preparedLoad;

  /// İlk görev bilet sahnesi sürerken inmeye başlar; oyun yükleniyor simgesi
  /// göstermeden açılsın.
  void prepareFirstTask() => _preparedLoad = loadNext();

  void discardPreparedTask() => _preparedLoad = null;

  /// Oyunun açılışı: hazırlanmış görev varsa onu kullanır.
  Future<void> startGame() {
    final prepared = _preparedLoad;
    _preparedLoad = null;
    return prepared ?? loadNext();
  }

  Future<void> loadNext({int completedTaskRetries = 0}) async {
    status = ArticlePracticeStatus.loading;
    answerResult = null;
    notifyListeners();
    try {
      final response = await _service.getNextTask(unit: _unit);
      final result = response.data;
      if (response.errorCode != null || result == null) {
        status = ArticlePracticeStatus.error;
      } else {
        step = result.step ?? step;
        learnedWordCount = result.learnedWordCount;
        requiredWordCount = result.requiredWordCount;
        final playableTask = _playableTask(result.task);
        final playableNextTask = _playableTask(result.nextTask);
        task = playableTask ?? playableNextTask;
        nextTask = task?.kartyId == playableNextTask?.kartyId
            ? null
            : playableNextTask;
        if (result.isUnlocked &&
            task == null &&
            result.task?.isArticleComplete == true &&
            completedTaskRetries < _maxCompletedTaskRetries) {
          await loadNext(completedTaskRetries: completedTaskRetries + 1);
          return;
        }
        if (!result.isUnlocked) {
          status = ArticlePracticeStatus.locked;
        } else {
          status = task != null
              ? ArticlePracticeStatus.playing
              : ArticlePracticeStatus.complete;
        }
      }
    } catch (_) {
      status = ArticlePracticeStatus.error;
    }
    notifyListeners();
  }

  Future<ArticlePracticeLoadResult?> prepareNext() async {
    final prefetched = nextTask;
    if (prefetched == null) return null;
    try {
      final response = await _service.getNextTask(
        preferredKartyId: prefetched.kartyId,
        unit: _unit,
      );
      if (response.errorCode != null) return null;
      return response.data;
    } catch (_) {
      return null;
    }
  }

  bool applyPrepared(ArticlePracticeLoadResult? result) {
    final preparedTask = _playableTask(result?.task);
    if (result == null || preparedTask == null) return false;
    step = result.step ?? step;
    learnedWordCount = result.learnedWordCount;
    requiredWordCount = result.requiredWordCount;
    task = preparedTask;
    nextTask = _playableTask(result.nextTask);
    answerResult = null;
    status = ArticlePracticeStatus.playing;
    notifyListeners();
    return true;
  }

  Future<ArticlePracticeAnswer?> answer(String article) async {
    final currentTask = task;
    if (!canInteract || currentTask == null) return null;
    status = ArticlePracticeStatus.checking;
    notifyListeners();
    try {
      final response = await _service.answer(
        kartyId: currentTask.kartyId,
        selectedArticle: article,
        unit: _unit,
      );
      answerResult = response.data;
      step = answerResult?.step ?? step;
      if (response.errorCode != null || answerResult?.isAccepted != true) {
        status = ArticlePracticeStatus.error;
      } else {
        status = answerResult!.isCorrect
            ? ArticlePracticeStatus.correct
            : ArticlePracticeStatus.wrong;
      }
    } catch (_) {
      status = ArticlePracticeStatus.error;
    }
    notifyListeners();
    return answerResult;
  }

  void retryCurrent() {
    if (task == null) return;
    status = ArticlePracticeStatus.playing;
    notifyListeners();
  }

  ArticlePracticeTask? _playableTask(ArticlePracticeTask? candidate) {
    if (candidate == null) return null;
    // Artikel adımı artikeli öğrenilmiş kelimeyi de takvimi geldiyse sorar.
    if (_unit == null && candidate.isArticleComplete) return null;
    return candidate;
  }
}
