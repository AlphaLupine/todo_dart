import 'package:flutter/material.dart';

class UniversalButton extends StatelessWidget {

  final String btnName;
  VoidCallback onPressed;

  UniversalButton({
    super.key,
    required this.btnName,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(btnName),
    );
  }
}