import 'package:flutter/material.dart';
import 'package:mail_app/Recently_Contacted.dart';
import 'package:mail_app/add_contact.dart';
import 'package:mail_app/models/contact_model.dart';

class Favourite extends StatefulWidget {
  final List<ContactModel> contacts;
  Favourite(this.contacts);
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var indexNumber = 0;
  void _newContact(name, email, photo) {
    var _newContactInfo =
        ContactModel(name: name, email: email, photo: photo, selected: false);
    widget.contacts.add(_newContactInfo);
    print(widget.contacts.toString());
    setState(() {
      widget.contacts.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    });
    print(_newContactInfo.email);
    print(_newContactInfo.name);
    print(_newContactInfo.photo);

    print(widget.contacts.toString());
  }

  void _showAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {},
          child: AddContact(_newContact),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
    // builder should return the widget that would be in the modal sheet
  }

  void screens(BuildContext context) {
    var screens = [
      AddContact(_newContact),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          _showAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: 700,
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 300,
                child: Text('Recently Contacted'),
              ),
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0; i < 5; i++)
                        RecentlyContacted(i, widget.contacts),
                      Card(
                        color: Colors.grey[200],
                        margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'More..',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: null,
                                icon: Icon(Icons.add),
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('All Contacts (${widget.contacts.length})'),
                  ),
                  Container(
                    width: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            icon: Icon(Icons.sort),
                            onPressed: () {
                              setState(() {
                                widget.contacts.sort((a, b) {
                                  return a.name
                                      .toLowerCase()
                                      .compareTo(b.name.toLowerCase());
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: widget.contacts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Card(
                        elevation: 1,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(style: BorderStyle.solid),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        '${widget.contacts[index].photo}'),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            ),
                            radius: 20,
                          ),
                          title: Text('${widget.contacts[index].name}'),
                          subtitle:
                              Text(widget.contacts[index].email.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// for (var i = 0; i < contacts.length; i++)
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 2),
//                         child: Card(
//                           elevation: 1,
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.white,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(style: BorderStyle.solid),
//                                     image: DecorationImage(
//                                       image: AssetImage('${contacts[i].photo}'),
//                                       fit: BoxFit.contain,
//                                     ),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(100))),
//                               ),
//                               radius: 20,
//                             ),
//                             title: Text('${contacts[i].name}'),
//                             subtitle: Text(contacts[i].email.toString()),
//                           ),
//                         ),
//                       ),
