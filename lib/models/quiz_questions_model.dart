class QuizModel {
  const QuizModel(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> shuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
