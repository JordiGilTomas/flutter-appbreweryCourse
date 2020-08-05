import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
      title: Text(
        'Buy milk',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Checkbox(
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}
