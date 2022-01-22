import 'package:flutter/material.dart';

class RecentMail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecentMailState();
}

class _RecentMailState extends State<RecentMail> {
  final List<Map<String, Object>> recentMail = [
    {'name': 'emmanuel', 'email': 'example@gmail.com'},
    {'name': 'Okafor', 'email': 'example@gmail.com'},
    {'name': 'Ekene', 'email': 'example@gmail.com'},
    {'name': 'Onyekachi', 'email': 'example@gmail.com'},
    {'name': 'Buffy', 'email': 'example@gmail.com'},
  ];

  var checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: ListView(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.zero,
      height: 328,
      width: double.infinity,
      // itemExtent: recentMail.length.toDouble(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Recent Mails',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ...(recentMail as List<Map<String, Object>>).map(
              (e) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  margin: EdgeInsets.fromLTRB(2, 10, 0, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: checked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checked = newValue!;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${recentMail[0]['name']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('${recentMail[0]['email']}',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black))
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.delete_forever_outlined),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
    // ),
  }
}
