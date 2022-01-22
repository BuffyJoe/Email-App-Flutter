import 'package:flutter/material.dart';
import 'package:mail_app/home.dart';
import 'package:mail_app/side_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final List<Map<String, Object>> contacts = [
    {'email': 'okaforbestkid@gmail.com', 'name': 'Nwoye'},
    {'email': 'okaforbestkid@gmail.com', 'name': 'Chukwunazaekpere'},
    {'email': 'okaforbestkid@gmail.com', 'name': 'Esther'},
    {'email': 'okaforbestkid@gmail.com', 'name': 'Okafor'},
  ];
  var indexNumber = 0;

  void _changeIndexNumber() {
    indexNumber++;
    setState(() {
      indexNumber;
    });
  }

  void _reset() {
    indexNumber = 0;
    setState(() {
      indexNumber;
    });
  }

  var selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: Icon(Icons.menu_rounded),
          title: Text(
            'Mass Messenger',
            style: TextStyle(fontFamily: 'Footlight'),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Icon(Icons.logout_outlined),
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            // onTap: (value) {
            //   selectedItem = value;
            //   setState(() {
            //     selectedItem;
            //   });
            // },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box),
                label: 'Compose',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_rounded),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
            ],
            currentIndex: selectedItem,
          ),
        ),
        body: indexNumber < contacts.length
            ? Home(contacts, indexNumber, _changeIndexNumber, _reset)
            : Card(
                child: Column(
                  children: [
                    Text('data'),
                    FloatingActionButton(
                      onPressed: _reset,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
