import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mail_app/recent_mail.dart';
import 'package:mail_app/search.dart';

class Home extends StatelessWidget {
  // final List<Map<String, Object>> contacts;
  // final int indexNumber;
  // final Function changeIndexNumber;

  // final Function _reset;

  // Home(this.contacts, this.indexNumber, this.changeIndexNumber, this._reset);
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountEmail: Text('okaforbestkid@gmail.com'),
                    accountName: Text('O.Emmanuel'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/niniola.jpeg'),
                          fit: BoxFit.cover,
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/chatbackground.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const ListTile(
                    leading: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text('Social'),
                    style: ListTileStyle.drawer,
                  ),
                  const ListTile(
                    leading: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.update,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text('Updates'),
                    style: ListTileStyle.list,
                  ),
                  const ListTile(
                    leading: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.label,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text('Promotions'),
                    style: ListTileStyle.list,
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text('Spam'),
                    style: ListTileStyle.list,
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.support_agent_sharp,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text(
                      'Contact Support',
                      style: TextStyle(fontFamily: 'Footlight'),
                    ),
                    style: ListTileStyle.list,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
