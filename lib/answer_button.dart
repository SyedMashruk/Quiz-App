import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.option, required this.click});
  final String option;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        backgroundColor: const Color.fromARGB(255, 57, 0, 104),
        foregroundColor: Colors.white,
      ),
      onPressed: click,
      child: Text(
        option,
        textAlign: TextAlign.center,
      ),
    );
  }
}
