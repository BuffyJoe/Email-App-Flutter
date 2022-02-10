import 'package:flutter/material.dart';
import 'package:mail_app/compose/compose.dart';
import 'package:mail_app/contacts/contacts.dart';
import 'package:mail_app/home/home.dart';
import 'package:mail_app/main.dart';
import 'package:mail_app/models/contact_model.dart';

class SideBar extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountEmail: Text('okaforbestkid@gmail.com'),
              accountName: Text('O.Emmanuel'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/images/new.jpg'),
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
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Log-in'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
              // this does not rebuild with the back arrow
            },
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            child: Column(
              children: [
                ExpansionTile(
                  leading: Icon(Icons.all_inbox_rounded),
                  title: Text('All Messages'),
                  trailing: Icon(Icons.expand_more_outlined),
                  children: [
                    Container(
                      height: 400,
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                        children: [
                          ListTile(
                            leading: Icon(Icons.inbox_rounded),
                            title: Text('Primary'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(Icons.people_outline_outlined),
                            title: Text('Social'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.label,
                            ),

                            title: Text('Promotions'),
                            // style: ListTileStyle.list,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                            ),
                            title: Text('Spam'),
                          ),
                          ListTile(
                            leading: Icon(Icons.drafts),
                            title: Text('Drafts'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(Icons.send),
                            title: Text('Sent'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(Icons.label),
                            title: Text('Proposal'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(Icons.inbox_rounded),
                            title: Text('Primary'),
                            onTap: null,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.star_border_purple500_rounded,
                            ),
                            title: Text('starred'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.contact_mail,
                  ),
                  title: Text('Contacts'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return Contacts(contacts);
                    }));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_activity_rounded,
                  ),
                  title: Text(
                    'Compose',
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) {
                      return Compose(contacts);
                    }));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
