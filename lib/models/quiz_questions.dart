class QuizQuestion {
  const QuizQuestion(this.text, this.questionOption);

  final String text;
  final List<String> questionOption;

  List<String> getSuffledAnswer() {
    final suffledAnswer = List.of(questionOption);
    suffledAnswer.shuffle();
    return suffledAnswer;
  }
}
