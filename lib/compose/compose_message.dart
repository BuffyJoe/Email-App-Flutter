import 'package:flutter/material.dart';
import 'package:mail_app/Sent/sent.dart';
import 'package:mail_app/contacts/contacts.dart';
import 'package:mail_app/models/contact_model.dart';
import 'package:mail_app/models/message_model.dart';

class ComposeMessage extends StatefulWidget {
  final List<ContactModel> _contacts;

  ComposeMessage(this._contacts);

  @override
  State<ComposeMessage> createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  final messageInput = TextEditingController();
  final subjectInput = TextEditingController();

  var preview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: 700,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Subject',
                ),
                controller: subjectInput,
                onChanged: (_) {
                  setState(() {
                    subjectInput;
                  });
                },
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                child: TextField(
                  maxLines: null,
                  minLines: 20,
                  controller: messageInput,
                  onChanged: (_) {
                    setState(() {
                      messageInput;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Write a message.....',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      preview = !preview;
                      setState(() {
                        preview;
                      });
                    },
                    child: Text('Preview'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print('clicked');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return Sent(MessageModel(
                              Body: messageInput.text.toString(),
                              Subject: subjectInput.text.toString(),
                              receiver: widget._contacts));
                        }));
                      },
                      child: Text('Done')),
                ],
              ),
              preview == true
                  ? Container(
                      height: 450,
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal:
                                        BorderSide(style: BorderStyle.solid)),
                                color: Colors.white60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('From: you@youremail.com'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Subject: ${subjectInput.text}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Recepients: ${widget._contacts.length} participant(s)'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              messageInput.text,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(border: Border.all()),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    )
                  : Container(),
              Container(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(5),
                // decoration: BoxDecoration(border: Border.all()),
                child: ExpansionTile(
                  leading: Icon(Icons.all_inbox_rounded),
                  title: Text('All Recepients'),
                  trailing: Icon(Icons.expand_more_outlined),
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(style: BorderStyle.solid))),
                      padding: EdgeInsets.zero,
                      height: widget._contacts.isEmpty
                          ? 0
                          : widget._contacts.length >= 5
                              ? 530
                              : 300,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: widget._contacts.length,
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(widget._contacts[index].photo),
                            ),
                            title: Text(widget._contacts[index].email),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                widget._contacts
                                    .remove(widget._contacts[index]);
                                setState(() {
                                  widget._contacts;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    widget._contacts.isNotEmpty
                        ? OutlinedButton(
                            onPressed: () {
                              widget._contacts
                                  .removeRange(0, widget._contacts.length);
                              setState(() {
                                widget._contacts;
                              });
                            },
                            child: Text('reset'))
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
