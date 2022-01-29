import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Function _changeIndexNumber;

  SideBar(this._changeIndexNumber);
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
              _changeIndexNumber(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () {
              _changeIndexNumber(0);
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
                    _changeIndexNumber(4);
                    Navigator.pop(context);
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
                    'Activity',
                  ),
                  onTap: () {
                    _changeIndexNumber(2);
                    Navigator.pop(context);
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
