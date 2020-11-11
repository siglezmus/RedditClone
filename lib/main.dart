import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
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
    final _feed = <Widget>[];

    Widget _buildRow(Widget feedItem) {
      return ListTile(
        title: feedItem,
      );
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
            child: Icon(Icons.more),
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
      return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //upvote downvote counter
            children: [
              Icon(Icons.arrow_upward),
              Text('1.4k'),
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
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
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
