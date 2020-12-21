import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rows_and_cols/screens/SavedScreen.dart';

import 'entity/Post.dart';
import 'model/Model.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Model>(
              create: (context) => Model()),
        ],
        child: MaterialApp(
            title: 'reddit',
            home: MyHomePage()));

  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();
    final _feed = <Post>[];

    Widget _buildRow(Widget feedItem) {
      return ListTile(
        title: feedItem,
      );
    }

    Post _buildPostItem() {
      //final model = Provider.of<Model>(context, listen: false);
      Post p = new Post();
      //model.see(p);
      return p;
    }

    Widget _buildFeedItems() {
      return ListView.builder(
          //padding: EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _feed.length) {
          for (int j = 0; j < 10; j++) {
            _feed.add(_buildPostItem());
          }
        }
        return _buildRow(_feed[index]);
      });
    }

    Drawer _getDrawer() {
      return (Drawer(
          child: Container(
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'u/siglezmus',
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Container(
                width: 230,
                height: 35,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.red[400],
                        Colors.red[600],
                        Colors.red[700],
                        Colors.red[800],
                      ],
                    ),
                    border: Border.all(
                      color: Colors.red[500],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.center_focus_strong),
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Style your avatar'),
                            ],
                          ),
                        )),
                  ],
                )),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [Icon(Icons.wb_sunny)],
                ),
                Column(
                  children: [
                    Text('915'),
                    Text('Karma'),
                  ],
                ),
                Container(
                  width: 1,
                  height: 25,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    color: Colors.grey,
                  ),
                  child: Text(''),
                ),
                Column(
                  children: [Icon(Icons.pie_chart)],
                ),
                Column(
                  children: [
                    Text('3y 5m'),
                    Text('Reddit age'),
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 1,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    color: Colors.grey,
                  ),
                  child: Text(''),
                )
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.account_box),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('My profile'),
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.attach_money),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Reddit Coins'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('0 Coins'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.person),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Reddit Premium'),
                    Text('Ads-free browsing'),
                  ],
                ),
              ],
            ),
            Container(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.save),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Saved'),
                  ],
                ),
              ],
            ),
            Container(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.history),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('History'),
                  ],
                ),
              ],
            ),
            Container(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.create_new_folder),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Create a community'),
                  ],
                ),
              ],
            ),
            Container(height: 120,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Icon(Icons.settings),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Settings'),
                  ],
                ),
              ],
            ),
          ],
        ),
      )));
    }

    AppBar _getAppBar() {
      return (AppBar(
        //leading: IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        title: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SavedScreen()
                  )
              );
            },
              icon: Icon(Icons.favorite),
          ),
        ],
      ));
    }

    BottomAppBar _getBottomAppBar() {
      return (BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.headset), onPressed: () {}),
            IconButton(icon: Icon(Icons.crop_square), onPressed: () {}),
            IconButton(icon: Icon(Icons.create), onPressed: () {}),
            IconButton(icon: Icon(Icons.chat_bubble), onPressed: () {}),
            IconButton(icon: Icon(Icons.message), onPressed: () {}),
          ],
        ),
      ));
    }

    return Scaffold(
      drawer: _getDrawer(),
      appBar: _getAppBar(),
      body: _buildFeedItems(),
      bottomNavigationBar: _getBottomAppBar(),
    );
  }
}
