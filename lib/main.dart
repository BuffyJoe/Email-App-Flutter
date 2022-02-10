import 'package:flutter/material.dart';
import 'package:mail_app/compose/compose.dart';
import 'package:mail_app/contacts/contacts.dart';
import 'package:mail_app/contacts/Recently_Contacted.dart';
import 'package:mail_app/home/home.dart';
import 'package:mail_app/Sent/sent.dart';
import 'package:mail_app/models/contact_model.dart';
import 'package:mail_app/side_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
        ),
      ),
      title: 'Flutter App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  // This widget is the root of your application.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<ContactModel> contacts = [
    ContactModel(
      email: 'sapa@gmail.com',
      name: 'Sapa',
      photo: 'assets/images/new.jpg',
      selected: false,
    ),
    ContactModel(
      name: 'sis',
      email: 'Sis@gmail.com',
      photo: 'assets/images/niniola.jpeg',
      selected: false,
    ),
    ContactModel(
      email: 'babe@gmail.com',
      name: 'Babe',
      photo: 'assets/images/niniola2.png',
      selected: false,
    ),
    ContactModel(
      email: 'dad@gmail.com',
      name: 'Dad',
      photo: 'assets/images/kaido.png',
      selected: false,
    ),
    ContactModel(
      email: 'bro@gmail.com',
      name: 'Bro',
      photo: 'assets/images/luffy.png',
      selected: false,
    ),
  ];

  void _changeIndexNumber(int index) {
    screenIndex = index;
    setState(() {
      screenIndex;
    });
  }

  var selectedItem = 0;
  var screenIndex = 0;

  void _onTap(int index) {
    print(index);
    if (index == 1) {
      print('inside ${index}');
      screenIndex = 0;
      setState(() {
        screenIndex;
      });
      return;
    } else {
      screenIndex = index;
      setState(() {
        print('outside $index');
        screenIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: SideBar(),
        appBar: AppBar(
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: 'Footlight',
                  color: Colors.white,
                ),
                border: UnderlineInputBorder(),
                hintText: 'Search...'),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Home(),
        ),
      ),
    );
  }
}
