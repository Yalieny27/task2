import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Project',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Task'),
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
  String globalValue = "";

  String titleText = "Task Project";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          semanticLabel: titleText,
          child: Column(
            children: [
              DrawerHeader(child: Image(image: AssetImage('assets/blue.jpg'))),
              ListTile(
                title: Text("Inbox"),
                leading: Icon(Icons.inbox),
                onTap: () {
                  setState(() {
                    globalValue = "Inbox";
                  });
                },
                onLongPress: () {
                  setState(() {
                    globalValue = "No long press option";
                  });
                },
              ),
              ListTile(
                title: Text("Outbox"),
                leading: Icon(Icons.outbox),
                onTap: () {
                  setState(() {
                    globalValue = "Outbox";
                  });
                },
                onLongPress: () {
                  setState(() {
                    globalValue = "No long press option";
                  });
                },
              ),
              ListTile(
                title: Text("Drafts"),
                leading: Icon(Icons.drafts),
                onTap: () {
                  setState(() {
                    globalValue = "Drafts";
                  });
                },
                onLongPress: () {
                  setState(() {
                    globalValue = "No long press option";
                  });
                },
              ),
            ],
          )),
      appBar: AppBar(
        title: Text(titleText, style: TextStyle(color: Colors.white)),
        actions: [
          InkWell(
            child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
            onTap: () {
              setState(() {
                globalValue = "Select the image";
              });
            },
          ),
          InkWell(
            child: Icon(Icons.alarm, color: Colors.white),
            onTap: () {
              setState(() {
                globalValue = "Set the Alarm";
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.login_rounded),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.logout),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.add_alarm_rounded),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.add_call)
              ],
            ),
            Image(image: AssetImage('assets/sunset.jpg')),
            Image.network('https://wallpaperaccess.com/full/1359481.jpg'),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Name", labelText: "Enter your name"),
            ),
            Container(
                color: Colors.purple.shade200,
                child: Text(
                  globalValue,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.purple.shade300,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              child: Text('Submit to next page'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Thank you for Submitting, Go back!'),
        ),
      ),
    );
  }
}
