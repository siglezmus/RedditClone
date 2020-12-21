import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedditBottomBar extends StatelessWidget{

  Function likeFoo;
  int curLikes;


  RedditBottomBar(this.likeFoo,
      this.curLikes);


  // RedditBottomBar(this.likeFoo) : this.curLikes = 0;


  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          //upvote downvote counter
          children: [
            IconButton(
              onPressed: () {
                likeFoo();
              },
              icon:Icon(Icons.arrow_upward),
            ),
            Text('$curLikes'),
            Icon(Icons.arrow_downward),
          ],
        ),
        Row(
          //comments
          children: [
            Icon(Icons.comment),
            Text('50'),
          ],
        ),
        Row(
          // share

          children: [
            Icon(Icons.share),
            Text('Share'),
          ],
        ),
        Row(
          //award
          children: [
            Icon(Icons.present_to_all),
            Text('Award'),
          ],
        ),
      ],
    ));
  }
}