import 'package:flutter/material.dart';
import 'about.dart';
import 'app.dart';



class HomePage extends StatelessWidget {
  final List<String> hymns =
      new List<String>.generate(5, (i) => "ghs ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.info,
              semanticLabel: 'info',
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );
            }),
        title: Center(
          child: Text('H y m n'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () => debugPrint('Icon tapped'))
        ],
        backgroundColor: Colors.green,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new ListView.builder(
        itemCount: hymns.length,
        itemBuilder: (context, int index) {
          return new Dismissible(
            key: new Key(hymns[index]),
            onDismissed: (direction) {
              hymns.removeAt(index);
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                  content: new Text("Item dismissed"),
                ),
              );
            },
            background: new Container(
              color: Colors.amber,
            ),
            child: new ListTile(
              title: new Text("${hymns[index]}")
            ),
          );
        },
      ),

      // Bottom menus
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(
                  Icons.content_paste
              ),
              title: new Text('Paste')
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.content_copy), title: new Text('Copy')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.content_cut), title: new Text('Cut')),
        ],
        onTap: (int i) => debugPrint('Touched $i'),
      ),

      // Side menu
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Hymn +'),
              accountEmail: new Text('judeokoroafor@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/{300}'),
              ),
            ),
            new ListTile(
              title: new Text('About Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new AboutPage()),
                );
              },
            ),
            new Divider(
              color: Colors.black45,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('About pop-up'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => _buildAboutDialog(context),
                  ),
//                      builder: (BuildContext context) => new AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('About  H Y M N +'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        _buildAboutText(),
//        _buildLogoAttribution(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay, got it!'),
      ),
    ],
  );
}
