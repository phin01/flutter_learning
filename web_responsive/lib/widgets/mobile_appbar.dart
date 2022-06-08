import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Image.asset('assets/img/logo.png',
      fit: BoxFit.contain,),
      
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search)
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_rounded)
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert)
        )
      ],
    );

  }
}