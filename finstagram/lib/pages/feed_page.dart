import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finstagram/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Feed Page will be rendered inside HomePage, which already has a Scaffold
class FeedPage extends StatefulWidget {

  @override
  State<FeedPage> createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {

  late double _deviceHeight, _deviceWidth;

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
    
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,

      child: _postsListView(),
    );
  }

  Widget _postsListView() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseService.getLatestPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          List posts = snapshot.data.docs.map((e) => e.data()).toList();
          print(posts);
          return ListView();
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}