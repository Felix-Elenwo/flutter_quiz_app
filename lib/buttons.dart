import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.buttonText, required this.onTap, super.key});

  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        
      ),
      child: Text(buttonText),
    );
  }
}

// working with function instead of class... Whichever is fine
// answerBtn(String questText, void Function() tap) {
//   return ElevatedButton(
//     onPressed: tap,
//     child: Text(questText),
//   );
// }


actionBtn(
    {required String btnText, required btnIcon, required Function() ontap}) {
  return OutlinedButton.icon(
    onPressed: ontap,
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(130, 20),
    ),
    label: Text(btnText),
    iconAlignment: IconAlignment.end,
    icon: Icon(btnIcon),
  );
}
