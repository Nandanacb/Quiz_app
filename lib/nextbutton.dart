import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const MyTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
         
          color: Colors.purple,
          /*onPressed != null
              ? const Color.fromARGB(255, 164, 234, 174)
              : null,*/
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 244, 251)),
            ),
          ),
        ),
      ),
    );
  }
}
