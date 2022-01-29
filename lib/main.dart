import 'package:flutter/material.dart';
import 'package:mail_app/compose.dart';
import 'package:mail_app/favourite.dart';
import 'package:mail_app/Recently_Contacted.dart';
import 'package:mail_app/home.dart';
import 'package:mail_app/inbox.dart';
import 'package:mail_app/models/contact_model.dart';
import 'package:mail_app/search.dart';
import 'package:mail_app/side_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.greenAccent,
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
      // index -= 1;
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
        backgroundColor: Colors.white,
        drawer: SideBar(_changeIndexNumber),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          foregroundColor: Colors.white,
          title: TextField(
            style: TextStyle(
                fontFamily: 'Footlight',
                color: Colors.white,
                backgroundColor: Colors.white),
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: 'Search...'),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Icon(Icons.logout_outlined),
            )
          ],
        ),
        body:
            // Favouritesss(context, screenIndex),
            Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Compose(contacts), //Screens[screenIndex],
        ),
      ),
    );
  }
}
