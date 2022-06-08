import 'package:flutter/material.dart';
import 'package:web_responsive/widgets/mobile_appbar.dart';
import 'package:web_responsive/widgets/shop_product.dart';
import 'package:web_responsive/widgets/web_appbar.dart';

class ResponsiveSampleShop extends StatefulWidget {
  const ResponsiveSampleShop({Key? key}) : super(key: key);

  @override
  State<ResponsiveSampleShop> createState() => _ResponsiveSampleShopState();
}

class _ResponsiveSampleShopState extends State<ResponsiveSampleShop> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){

      double _width = constraints.maxWidth;
      
      return Scaffold(
        appBar: _appBarBuilder(_width),
        body: _imageGalleryBuilder(_width),

    );
    });
  }

  PreferredSizeWidget _appBarBuilder(double width) {
    Widget appBar = width < 600 ? const MobileAppBar() : const WebAppBar();
    return PreferredSize(preferredSize: Size(width, AppBar().preferredSize.height), child: appBar);
  }

  Widget _imageGalleryBuilder(double width) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: _galleryColumnCounter(width),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: const [
          ShopProduct("Produto ABC", "500,00", "p1.jpg"),
          ShopProduct("Produto XYZ", "1.500,00", "p2.jpg"),
          ShopProduct("Produto Muito Bom", "9.500,00", "p3.jpg"),
          ShopProduct("Produto Razoável", "500,00", "p4.jpg"),
          ShopProduct("Produto Pegadinha", "6.500,00", "p5.jpg"),
          ShopProduct("Produto Quebrado", "0,00", "p6.jpg"),
        ],
      )
    );
  }


  int _galleryColumnCounter(double width) {
    if(width < 600) {
      return 2;
    } else if (width < 960) {
      return 4;
    } else {
      return 6;
    }
  }


}