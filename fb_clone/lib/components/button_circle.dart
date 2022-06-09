import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const ButtonCircle({required this.icon, required this.iconSize, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return 
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(4),
      child: IconButton(onPressed: (){}, icon: Icon(icon), iconSize: iconSize, color: Colors.black,)
    );
  }
}