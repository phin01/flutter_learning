import 'package:fb_clone/components/story_card.dart';
import 'package:fb_clone/models/story.dart';
import 'package:fb_clone/models/user.dart';
import 'package:flutter/material.dart';

class StoriesScroll extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  const StoriesScroll({required this.currentUser, required this.stories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      color: Colors.orange,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length, 
        itemBuilder: (BuildContext context, int index) {
          Story currentStory = stories[index];

          return Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            child: StoryCard(currentStory: currentStory,)
          );
        }
      ),

    );
    
  }
}