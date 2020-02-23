import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 2;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int onClick() {
    return 4;
  }

  int subtractNumbers() {
    return 5;
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: Column(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text("xyz"),
          accountEmail: Text("xyz@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text("xyz"),
          ),
          otherAccountsPictures: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("A"),
            )
          ],
        ),
        ListTile(
          title: new Text("All Inboxes"),
          leading: new Icon(Icons.mail),
        ),
        Divider(
          height: 0.1,
        ),
        ListTile(
          title: new Text("Primary"),
          leading: new Icon(Icons.inbox),
        ),
        ListTile(
          title: new Text("Social"),
          leading: new Icon(Icons.people),
        ),
        ListTile(
          title: new Text("Promotions"),
          leading: new Icon(Icons.local_offer),
        )
      ])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row /*or Column*/ (
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
                Icon(Icons.star, size: 50),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max, // This is the magic. :)
              children: <Widget>[
                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onClick, // Button onClick function
                  child: new Text("Button 1"),
                ),
                new RaisedButton(
                  onPressed: subtractNumbers,
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Button 2",
                  ),
                ),
                new RaisedButton(
                  onPressed: subtractNumbers,
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Button 3",
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Toggle me!'),
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: isPressed ? Colors.red : Colors.blue,
                  onPressed: () => setState(() => isPressed =
                      !isPressed), // make state changes in a setState
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.lightbulb_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Add"),
            icon: Icon(Icons.add_box),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      primary: true,
    );
  }
}
