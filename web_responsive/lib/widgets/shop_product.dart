import 'package:flutter/material.dart';

class ShopProduct extends StatelessWidget {

  final String _description;
  final String _price;
  final String _imagePath;

  const ShopProduct(this._description, this._price, this._imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(flex: 8, child: Image.asset('assets/img/$_imagePath')),
            Expanded(flex: 1, child: Text(_description)),
            Expanded(flex: 1, child: Text("R\$ $_price", style: const TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}