import 'package:fb_clone/models/models.dart';

class Story {

  final User storyCreator;
  final String storyImageURL;
  final bool storySeen;

  Story({required this.storyCreator, required this.storyImageURL, this.storySeen = false});
  
}