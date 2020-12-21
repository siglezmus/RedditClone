import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rows_and_cols/entity/Post.dart';
import 'package:rows_and_cols/model/Model.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context, listen: false);

    List<Post> saved = model.saved;

    return Scaffold(
      body: _buildFeedItems(saved),
    );

    // return Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
    //     child: Column(
    //       children: saved
    //     ));
  }

  Widget _buildFeedItems(List<Post> saved) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: saved.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(2),
            child: saved[index]
          );
        });
    //   return ListView.builder(
    //     //padding: EdgeInsets.all(16.0),
    //       itemBuilder: /*1*/ (context, i) {
    //         if (i.isOdd) return Divider(); /*2*/
    //
    //         final index = i ~/ 2; /*3*/
    //         if (index >= _feed.length) {
    //           for (int j = 0; j < 10; j++) {
    //             _feed.add(_buildPostItem());
    //           }
    //         }
    //         return _buildRow(_feed[index]);
    //       });
    // }
  }
}
