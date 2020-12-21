import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rows_and_cols/model/Model.dart';

import 'RedditBottomBar.dart';

class Post extends StatefulWidget {
  static int autoIncrement = 0;
  int id;
  int likes = 0;

  Post() {
    this.id = autoIncrement++;
  }

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  void likeFoo() {
    setState(() {
      widget.likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
       return new Container(
        child: _buildPostItem(), //new Text(widget.id.toString()),
        //todo MOVE PAINTING OF POST HERE
      );
  }


  Widget _buildPostItem() {
    return (Column(
      children: [
        _buildUpperPart(),
        Container(
          height: 10,
        ),
        _buildTitlePart(),
        Container(
          height: 10,
        ),
        _buildContentPart(),
        Container(
          height: 10,
        ),
        _buildBottomPart()
      ],
    ));
  }


  Widget _buildUpperPart() {
    return (Row(
      children: [
        Expanded(
          child: Icon(Icons.check_circle),
          flex: 1,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [Text("r/memes")],
              ),
              Row(
                children: [Text("Posted by u/siglezmus * 2h * i.redd.it")],
              ),
            ],
          ),
          flex: 7,
        ),
        Expanded(
          child:
          IconButton(
            onPressed: () {
              final model =
              Provider.of<Model>(context, listen: false);
              model.save(widget);
            },
            icon: Icon(Icons.more),
          ),
        ),
      ],
    ));
  }


  Widget _buildContentPart() {
    return (Image.asset(
      'assets/images/bg_image1.png',
      fit: BoxFit.contain,
    ));
  }

  Widget _buildTitlePart() {
    return (Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Funi meme',
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    ));
  }

  Widget _buildBottomPart() {
    return RedditBottomBar(likeFoo, widget.likes);
  }

}
