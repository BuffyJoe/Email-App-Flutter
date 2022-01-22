import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mail_app/recent_mail.dart';
import 'package:mail_app/search.dart';

class Home extends StatelessWidget {
  final List<Map<String, Object>> contacts;
  final int indexNumber;
  final Function changeIndexNumber;

  final Function _reset;

  Home(this.contacts, this.indexNumber, this.changeIndexNumber, this._reset);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          // Container(
          //   padding: EdgeInsets.all(5),
          //   width: 300,
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.favorite,
          //         color: Colors.red,
          //       ),
          //       Icon(
          //         Icons.favorite,
          //         color: Colors.red,
          //       ),
          //       Icon(
          //         Icons.favorite,
          //         color: Colors.red,
          //       ),
          //     ],
          //   ),
          // ),
          // indexNumber < contacts.length
          // ? Container(
          //     width: double.infinity,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         ...(contacts as List<Map<String, Object>>)
          //             .map((index) {
          //           return Card(
          //             color: Colors.grey[200],
          //             margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
          //             elevation: 2,
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Column(
          //                 crossAxisAlignment:
          //                     CrossAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                       height: 30,
          //                       width: 30,
          //                       padding:
          //                           EdgeInsets.fromLTRB(3, 0, 3, 0),
          //                       margin:
          //                           EdgeInsets.fromLTRB(3, 0, 3, 0),
          //                       decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(100),
          //                           ),
          //                           image: DecorationImage(
          //                             fit: BoxFit.fill,
          //                             image: AssetImage(
          //                                 'assets/images/niniola.jpeg'),
          //                           ))),
          //                   Text(
          //                     contacts[indexNumber]['name']
          //                         .toString(),
          //                     style: TextStyle(
          //                       fontSize: 12,
          //                       color: Colors.black54,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           );
          //         }).toList(),
          //         Card(
          //           color: Colors.grey[200],
          //           margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
          //           elevation: 2,
          //           child: Padding(
          //             padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   'See More..',
          //                   style: TextStyle(
          //                     fontSize: 10,
          //                     color: Colors.blue,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 IconButton(
          //                   onPressed: null,
          //                   icon: Icon(Icons.add),
          //                   iconSize: 20,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   )
          // : Card(
          //     child: Column(
          //       children: [
          //         Text('data'),
          //         FloatingActionButton(
          //           onPressed: _reset(),
          //         ),
          //       ],
          //     ),
          //   ),
          //     ],
          //   ),
          // ),
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
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ),
                    );
                  },
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
    );
  }
}
