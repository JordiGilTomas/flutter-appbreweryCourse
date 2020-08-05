import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'MessageBuble.dart';

class MessageStream extends StatelessWidget {
  MessageStream({@required this.loggedInUserEmail});

  final _firestore = Firestore.instance;
  final String loggedInUserEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .orderBy('time', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data.documents.reversed;
          return Expanded(
            child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: messages
                    .map(
                      (m) => MessageBubble(
                        text: m.data['text'],
                        sender: m.data['sender'],
                        time: m.data['time'],
                        isMe: m.data['sender'] == loggedInUserEmail,
                      ),
                    )
                    .toList()),
          );
        });
  }
}
