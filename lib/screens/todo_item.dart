import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/screens/task_details.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDoItem;
  const ToDoItem({super.key, required this.toDoItem});

  @override
  Widget build(BuildContext context) {
    Color tileColor = const Color(0xff252c4a);
    Color whiteColor = Colors.white;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        tileColor: tileColor,
        title: Text(
          toDoItem.name,
          style: TextStyle(color: whiteColor),
        ),
        trailing: IconButton(
          icon: Icon(
            CupertinoIcons.arrow_right_circle_fill,
            size: 30,
            color: whiteColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => TaskDetails(
                        taskName: toDoItem.name,
                        taskDesc: toDoItem.taskDesc,
                        taskEst: toDoItem.taskEst))));
          },
        ),
      ),
    );
  }
}
