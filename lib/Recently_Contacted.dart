import 'package:flutter/material.dart';
import 'package:mail_app/models/contact_model.dart';

class RecentlyContacted extends StatelessWidget {
  final int i;
  final List<ContactModel> contacts;
  RecentlyContacted(this.i, this.contacts);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('${contacts[i].photo}'),
                    ))),
            Text(
              contacts[i].name.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
