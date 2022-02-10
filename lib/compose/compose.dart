import 'package:flutter/material.dart';
import 'package:mail_app/compose/add_recepient.dart';
import 'package:mail_app/compose/compose_message.dart';
import 'package:mail_app/Sent/sent.dart';
import 'package:mail_app/models/contact_model.dart';
import 'package:mail_app/side_bar.dart';

class Compose extends StatelessWidget {
  final List<ContactModel> contacts;
  Compose(this.contacts);
  final List<ContactModel> newContacts = [];
  void selectedContacts() {
    newContacts.removeRange(0, newContacts.length);
    newContacts.addAll(
      contacts.where((element) => element.selected == true),
    );
    print(newContacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SideBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          selectedContacts();
          if (newContacts.isEmpty) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) {
                return ComposeMessage(newContacts);
              },
            ),
          );
        },
        label: Text('Done'),
      ),
      body: AddRecepient(contacts, newContacts, selectedContacts),
    );
  }
}
