import 'package:flutter/material.dart';
import 'package:mail_app/compose/compose.dart';
import 'package:mail_app/home/home.dart';
import 'package:mail_app/models/contact_model.dart';
import 'package:mail_app/models/message_model.dart';
import 'package:mail_app/side_bar.dart';

class Sent extends StatefulWidget {
  final MessageModel messageList;
  Sent(this.messageList);

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> {
  final List<MessageModel> newMessageList = [
    MessageModel(
      receiver: [
        ContactModel(
          name: 'name',
          email: 'email',
          photo: 'photo',
        ),
      ],
      Subject: '1234567890QWERTYUIOPASDFGHJKL',
      Body: 'My Body',
    )
  ];
  void addMessage() {
    newMessageList.add(widget.messageList);
    setState(() {
      newMessageList;
    });
    print(newMessageList);
  }

  void _changeIndexNumber(int index) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sent Items'),
      ),
      drawer: SideBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: addMessage,
        child: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: newMessageList.isNotEmpty
            ? ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ListTile(
                    hoverColor: Colors.blue,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return MailPage(newMessageList[index]);
                      }));
                    },
                    leading: Icon(Icons.check_circle_outlined),
                    title: newMessageList[index].Subject.length > 18
                        ? Text(
                            '${newMessageList[index].Subject.substring(0, 18)}....',
                            style: TextStyle(fontSize: 18),
                          )
                        : Text(
                            '${newMessageList[index].Subject}',
                            style: TextStyle(fontSize: 18),
                          ),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          newMessageList[index].Body.length > 20
                              ? Text(
                                  '${newMessageList[index].Body.substring(0, 20)}....',
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  '${newMessageList[index].Body}',
                                  style: TextStyle(fontSize: 15),
                                ),
                          Text(
                            '${newMessageList[index].receiver.length} recepient(s)',
                            style: TextStyle(fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.delete_forever)),
                              IconButton(
                                  onPressed: null, icon: Icon(Icons.forward)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          '3days',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ); 
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: newMessageList.length)
            : Container(
                child: Text('This is because the list of message is empty'),
              ),
      ),
    );
  }
}

class MailPage extends StatelessWidget {
  final MessageModel mail;
  MailPage(this.mail);
  var screenIndex = 0;
  void _changeIndexNumber(int index) {
    screenIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SideBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(style: BorderStyle.solid)),
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
                    child: Text('Subject: ${mail.Subject}'),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Recepients: ${mail.receiver.length} recepient(s)')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${mail.Body}',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
