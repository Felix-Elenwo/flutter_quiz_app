# flutter_quiz_app

A quiz taking application built using Flutter. The app presents a series of questions to the user, allowing them to select answers and view results after successfully answering questions. It features question shuffling, answer validation, navigation between questions, and a summary of answers after completion.



Features

Shuffled Questions: The list of quiz questions is shuffled for a varied experience each time the app is launched.

Answer Selection: Users can select one answer per question, and answers are highlighted.

Answer Resubmission: Users can change their answer for a question before proceeding. The newly selected answer will replace the previously selected answer.

Navigation:
Users can move back and forth between questions using 'Next' and 'Previous' buttons. A 'Submit' button is available on the last question to submit the quiz and view quiz result.

Answer Validation: Users cannot move to the next question without selecting an answer. A snack bar notification prompts them to choose an answer if they attempt to proceed without selecting one.

Results Display: After submitting the quiz, the app displays a summary screen showing correct and incorrect answers, along with the total score.

Restart Option: After completing the quiz, users can restart it and retake the quiz with a fresh question order.



SCEREENS

Start Screen: Displays the app's logo and a button to begin the quiz.

Questions Screen:
Presents a question and multiple-choice answers.
Users select answers and navigate between questions.

Results Screen:
Shows the quiz score and a summary of the user's answers as against the correct answers.
Allows users to restart the quiz.



How It Works

Question Shuffling: The list of questions is shuffled only once when the app starts, ensuring the order stays fixed throughout the quiz.

Answer Tracking: User-selected answers are tracked and stored, allowing for resubmission and seamless navigation between questions.

Quiz Completion: After answering the final question, users submit the quiz, and the app calculates and displays their results.




FUTURE ENHANCEMENTS:

Timed Questions: Add a timer for each question to create a more challenging quiz experience.

Persistent Data: Save the user's progress so they can return to the quiz later.

Dynamic Question Loading: Load questions from an external API or file for dynamic content updates.
