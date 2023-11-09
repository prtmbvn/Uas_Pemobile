import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
   final VoidCallback? onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFFB54AC2),
      onPressed: onPressed,
    );
  }
}