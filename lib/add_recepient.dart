// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import './models/contact_model.dart';

class AddRecepient extends StatefulWidget {
  final List<ContactModel> contacts;
  final Function selectedContacts;

  final List<ContactModel> newContacts;
  AddRecepient(this.contacts, this.newContacts, this.selectedContacts);
  @override
  _AddRecepientState createState() => _AddRecepientState();
}

class _AddRecepientState extends State<AddRecepient> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
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
                      trailing: Checkbox(
                        value: widget.contacts[index].selected,
                        onChanged: (value) {
                          setState(() {
                            widget.contacts[index].selected =
                                !widget.contacts[index].selected;
                          });
                        },
                      ),
                      title: Text(widget.contacts[index].name.toString()),
                      subtitle: Text(widget.contacts[index].email.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: widget.contacts.length),
            ),
          ),
        ],
      ),
    );
  }
}
