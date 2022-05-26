import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:finstagram/pages/feed_page.dart';
import 'package:finstagram/pages/profile_page.dart';
import 'package:finstagram/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  late double _deviceHeight, _deviceWidth;
  int _navBarIndex = 0; 

  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage()
  ];

  late FirebaseService _firebaseService;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }
  
  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _homeAppBar(),
      bottomNavigationBar: _homeBottomNavBar(),
      body: _pages[_navBarIndex],
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
            onTap: _postImage,
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

  Future<void> _postImage() async {

    FilePickerResult? pickedImages = await FilePicker.platform.pickFiles(type: FileType.image);
    File image = File(pickedImages!.files.first.path!);

    bool uploadResult = await _firebaseService.postImage(image);
  }

}