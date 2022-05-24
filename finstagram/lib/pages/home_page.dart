import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  late double _deviceHeight, _deviceWidth;
  int _navBarIndex = 0; 
  
  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _homeAppBar(),
      bottomNavigationBar: _homeBottomNavBar(),
    );
  }

  PreferredSizeWidget _homeAppBar() {
    return AppBar(
      title: const Text("Finstagram"),
      actions: [
        // Icon to add new Photo
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () { },
            child: const Icon(Icons.add_a_photo)
          ),
        ),
        // Icon for logout
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () { },
            child: const Icon(Icons.logout)
          ),
        ),
      ],
    );
  }

  Widget _homeBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _navBarIndex,
      onTap: (selectedIndex) {
        setState(() {
          _navBarIndex = selectedIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.feed)),
        BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.account_box)),
      ]
    );
  }

}