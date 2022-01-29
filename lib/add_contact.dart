import 'package:flutter/material.dart';
import 'package:mail_app/models/contact_model.dart';

class AddContact extends StatefulWidget {
  final Function _createContact;
  AddContact(this._createContact);
  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final inputName = TextEditingController();

  final inputEmail = TextEditingController();

  void submitData() {
    final enteredText = inputName.text;
    final enteredEmail = inputEmail.text;
    final photo = 'assets/images/niniola2.png';
    if (enteredText.isEmpty || enteredEmail.isEmpty) {
      return;
    }
    widget._createContact(enteredText, enteredEmail, photo);
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 10,
            left: 10,
            right: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  decoration:
                      InputDecoration(counter: null, hintText: 'Contact Name'),
                  style: TextStyle(fontSize: 15),
                  controller: inputName,
                ),
                TextField(
                  decoration:
                      InputDecoration(counter: null, hintText: 'Contact Email'),
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                  controller: inputEmail,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    submitData();
                  },
                  child: Icon(Icons.check),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
