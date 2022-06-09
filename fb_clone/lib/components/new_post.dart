import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/models/user.dart';
import 'package:flutter/material.dart';

/// 
/// The New Post area will contain a Column with:
///   - A Row showing the logged in user's avatar + a TextBox to include a new post text
///   - A simple Divider
///   - A Row with three buttons (start live stream / post new photo / start chat room)
/// 
class NewPostArea extends StatelessWidget {

  final User currentUser;

  const NewPostArea({required this.currentUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(currentUser.imageURL),
              ),
              const SizedBox(width: 18,),
              const Expanded(child: TextField(
                decoration: InputDecoration.collapsed(hintText: "What are you thinking about?"),
              ),)
            ],
          ),

          const Divider(
            height: 10,
            thickness: 0.5,
            color: Colors.grey,
          ),

          Container(
            height: 40,
            color: Colors.white,
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TextButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.videocam,
                   color: Colors.red,
                   ),
                  label: const Text('Go Live', style: TextStyle(color: Colors.black),)
                ),
                const VerticalDivider(width: 8,),

                TextButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green
                  ), 
                  label: const Text('Photos', style: TextStyle(color: Colors.black),)
                ),
                const VerticalDivider(width: 8,),

                TextButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purple,
                  ), 
                  label: const Text('Video Call', style: TextStyle(color: Colors.black),)
                ),
              ],
            ),
          )
        ],
      ),




    );
    
  }



}