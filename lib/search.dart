import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            'Fetching results...',
            style: TextStyle(fontSize: 20, fontFamily: 'Footlight'),
          )),
    );
  }
}
