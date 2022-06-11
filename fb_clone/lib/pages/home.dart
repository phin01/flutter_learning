import 'package:fb_clone/components/button_circle.dart';
import 'package:fb_clone/components/new_post.dart';
import 'package:fb_clone/components/stories_scroll.dart';
import 'package:fb_clone/data/dummy_data.dart';
import 'package:fb_clone/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text('facebook', style: TextStyle(color: ColorPalette.fbBlue, fontWeight: FontWeight.bold, fontSize: 28, letterSpacing: -1),),
            centerTitle: false,
            // this property makes sure the app bar disappears when scrolling down, 
            // but shows up as soon as the user starts scrolling up, before reaching the top of the content
            floating: true,

            actions: [
              ButtonCircle(icon: Icons.search, iconSize: 30, onPressed: (){},),
              ButtonCircle(icon: LineIcons.facebookMessenger, iconSize: 30, onPressed: (){},),
            ],
          ),

          // New post area
          SliverToBoxAdapter(
            child: NewPostArea(currentUser: dummyCurrentUser),
          ),

          // Padding before list of Stories
          const SliverPadding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),

          // List of Stories
          SliverToBoxAdapter(
            child: StoriesScroll(currentUser: dummyCurrentUser, stories: dummyStories),
          ),

          SliverToBoxAdapter(
            child: Container(height: 500, color: Colors.green,),
          ),



        ],
      ),
    );
  }
}