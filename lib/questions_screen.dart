import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/buttons.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.selectedAnswers,
  });

  final void Function(String answer) onSelectAnswer;
  final List<String> selectedAnswers;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  String? selectedAnswer; // to track the selected answer for each question

  // Function to handle answer selection
  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer; // Update selected answer when button is tapped
    });
  }

  // Function to handle submitting or moving to the next question
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // Pass the selected answer back
    setState(() {
      if (widget.selectedAnswers.length > currentQuestionIndex) {
        widget.selectedAnswers[currentQuestionIndex] = selectedAnswer;
      } else {
        widget.selectedAnswers.add(selectedAnswer);
      }
      currentQuestionIndex++;
      this.selectedAnswer = null; // Clear selected answer for the next question
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  void previousQuestion() {
    setState(() {
      currentQuestionIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.questionText,
                style: GoogleFonts.lato(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              // Spreading the list of answer button using 3dots (...) so dart converts the
              //sees the map as widgets, not as a list
              ...currentQuestion.shuffledAnswers().map(
                (answers) {
                  return ElevatedButton(
                    onPressed: () {
                      selectAnswer(answers); //highlight the selected answer
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedAnswer == answers
                            ? Colors
                                .orange //change button colour when answer is selected
                            : Colors
                                .white // Default color for unselected buttons
                        ),
                    child: Text(
                      answers,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedAnswer == answers
                            ? Colors
                                .white // Change text colour when answer is selected
                            : Colors.deepOrange, // Default text color
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  actionBtn(
                    btnText: "Previous",
                    btnIcon: Icons.arrow_back_outlined,
                    ontap: () {
                      if (currentQuestion == questions.first) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Durations.long4,
                            content: Text("Go next"),
                          ),
                        );
                      } else {
                        previousQuestion(); // Proceed to the next question
                      }
                      // if (currentQuestionIndex > 0) {
                      //   previousQuestion();
                      // }
                    },
                  ),
                  actionBtn(
                    btnText:
                        currentQuestion == questions.last ? 'Submit' : 'Next',
                    btnIcon: Icons.arrow_forward_outlined,
                    ontap: () {
                      if (selectedAnswer == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text("Please pick an answer"),
                          ),
                        );
                      } else {
                        if (currentQuestionIndex == questions.length - 1) {
                          // If it's the last question, submit the quiz
                          answerQuestion(selectedAnswer!); // Submit the answers
                        } else {
                          // If not the last question, move to the next
                          answerQuestion(
                              selectedAnswer!); // Go to the next question
                        }
                      }
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
