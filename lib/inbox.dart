import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose'),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: null,
        child: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            'Inbox',
            style: TextStyle(fontSize: 20, fontFamily: 'Footlight'),
          )),
    );
  }
}
