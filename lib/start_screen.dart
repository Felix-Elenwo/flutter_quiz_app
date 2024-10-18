import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key})
      : color1 = Colors.deepOrange,
        color2 = Colors.orange;

  final void Function() startQuiz;

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/assets/images/quiz-logo.png',
                color: const Color.fromARGB(150, 255, 255, 255),
                height: 300,
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Flutter quiz app',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  color: const Color.fromARGB(150, 244, 217, 206),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.deepOrange),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
