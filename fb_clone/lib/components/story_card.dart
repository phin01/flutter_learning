import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/models/story.dart';
import 'package:flutter/material.dart';


class StoryCard extends StatelessWidget {
  
  final Story currentStory;
  
  const StoryCard({required this.currentStory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: currentStory.storyImageURL,
            height: 100,
            width: 110,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}