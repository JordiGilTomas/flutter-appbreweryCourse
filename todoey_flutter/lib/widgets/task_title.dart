import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.title, this.toogleStatus, this.deleteTask});

  final bool isChecked;
  final String title;
  final Function toogleStatus;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => showDialog<void>(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: AlertDialog(
            title: Text('Delete Task'),
            content: SingleChildScrollView(
              child: Text('Do you want to delete the task $title?'),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.pop(context)),
              FlatButton(
                child: Text('Confirm'),
                onPressed: () {
                  deleteTask();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (_) => toogleStatus(),
      ),
    );
  }
}
