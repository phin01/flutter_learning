import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/astro_moon.png"),
          )
        ),
      ),
    );
  }



}