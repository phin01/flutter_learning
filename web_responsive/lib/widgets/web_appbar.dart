import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return AppBar(
    title: Row(
      children: [
        Image.asset('assets/img/logo.png'),
        Expanded(child: Container()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded)),
        OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, primary: Colors.white),child: const Text('Cadastrar'),),
        const SizedBox(width: 8,),
        OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(backgroundColor: Colors.orangeAccent, primary: Colors.white), child: const Text('Logar')),
      ],
    )
  );
  }
}