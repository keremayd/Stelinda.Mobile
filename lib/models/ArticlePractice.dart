/// Artikel oyununun patikadaki adımdan açıldığını söyler: hangi ünitenin
/// Artikel adımı (sırası).
class ArticleStepArgs {
  const ArticleStepArgs({required this.unit});

  final int unit;
}

class ArticlePracticeTask {
  const ArticlePracticeTask({
    required this.kartyId,
    required this.nounText,
    required this.kartyUrl,
    required this.articleAttemptCount,
    required this.articleCorrectCount,
    required this.learningStack,
    required this.learningGoal,
    this.localImagePath = '',
  });

  final int kartyId;
  final String nounText;
  final String kartyUrl;
  final int articleAttemptCount;
  final int articleCorrectCount;
  final int learningStack;
  final int learningGoal;
  final String localImagePath;

  bool get isArticleComplete => learningStack >= learningGoal;

  factory ArticlePracticeTask.fromJson(Map<String, dynamic> json) {
    return ArticlePracticeTask(
      kartyId: json['kartyId'] as int,
      nounText: json['nounText'] as String? ?? '',
      kartyUrl: json['kartyUrl'] as String? ?? '',
      articleAttemptCount: json['articleAttemptCount'] as int? ?? 0,
      articleCorrectCount: json['articleCorrectCount'] as int? ?? 0,
      learningStack: json['learningStack'] as int? ?? 0,
      learningGoal: json['learningGoal'] as int? ?? 5,
    );
  }

  ArticlePracticeTask withLocalImage(String path) {
    return ArticlePracticeTask(
      kartyId: kartyId,
      nounText: nounText,
      kartyUrl: kartyUrl,
      articleAttemptCount: articleAttemptCount,
      articleCorrectCount: articleCorrectCount,
      learningStack: learningStack,
      learningGoal: learningGoal,
      localImagePath: path,
    );
  }
}

/// Patikanın Artikel adımının ilerlemesi (24 Kas 2026): turda doğru
/// bilinen artikel ve hedef. Tur yarıda bırakılırsa sunucuda kalır.
class ArticleStepProgress {
  const ArticleStepProgress({
    required this.correctCount,
    required this.goal,
    required this.completed,
  });

  final int correctCount;
  final int goal;
  final bool completed;

  static ArticleStepProgress? fromJson(Object? json) {
    if (json is! Map<String, dynamic>) return null;
    return ArticleStepProgress(
      correctCount: json['correctCount'] as int? ?? 0,
      goal: json['goal'] as int? ?? 10,
      completed: json['completed'] as bool? ?? false,
    );
  }
}

class ArticlePracticeLoadResult {
  const ArticlePracticeLoadResult({
    required this.isUnlocked,
    required this.learnedWordCount,
    required this.requiredWordCount,
    this.task,
    this.nextTask,
    this.step,
  });

  final bool isUnlocked;
  final int learnedWordCount;
  final int requiredWordCount;
  final ArticlePracticeTask? task;
  final ArticlePracticeTask? nextTask;

  /// İstekte ünite varsa Artikel adımının ilerlemesi.
  final ArticleStepProgress? step;

  factory ArticlePracticeLoadResult.fromJson(Map<String, dynamic> json) {
    final taskJson = json['task'];
    return ArticlePracticeLoadResult(
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      learnedWordCount: json['learnedWordCount'] as int? ?? 0,
      requiredWordCount: json['requiredWordCount'] as int? ?? 2,
      task: taskJson is Map<String, dynamic>
          ? ArticlePracticeTask.fromJson(taskJson)
          : null,
      nextTask: json['nextTask'] is Map<String, dynamic>
          ? ArticlePracticeTask.fromJson(
              json['nextTask'] as Map<String, dynamic>,
            )
          : null,
      step: ArticleStepProgress.fromJson(json['step']),
    );
  }

  ArticlePracticeLoadResult withTasks({
    required ArticlePracticeTask? task,
    required ArticlePracticeTask? nextTask,
  }) {
    return ArticlePracticeLoadResult(
      isUnlocked: isUnlocked,
      learnedWordCount: learnedWordCount,
      requiredWordCount: requiredWordCount,
      task: task,
      nextTask: nextTask,
      step: step,
    );
  }
}

class ArticlePracticeAnswer {
  const ArticlePracticeAnswer({
    required this.isAccepted,
    required this.isCorrect,
    required this.correctArticle,
    required this.articleAttemptCount,
    required this.articleCorrectCount,
    this.step,
  });

  final bool isAccepted;
  final bool isCorrect;
  final String correctArticle;
  final int articleAttemptCount;
  final int articleCorrectCount;

  /// İstekte ünite varsa Artikel adımının cevaptan sonraki ilerlemesi.
  final ArticleStepProgress? step;

  factory ArticlePracticeAnswer.fromJson(Map<String, dynamic> json) {
    return ArticlePracticeAnswer(
      isAccepted: json['isAccepted'] as bool? ?? false,
      isCorrect: json['isCorrect'] as bool? ?? false,
      correctArticle: json['correctArticle'] as String? ?? '',
      articleAttemptCount: json['articleAttemptCount'] as int? ?? 0,
      articleCorrectCount: json['articleCorrectCount'] as int? ?? 0,
      step: ArticleStepProgress.fromJson(json['step']),
    );
  }
}
