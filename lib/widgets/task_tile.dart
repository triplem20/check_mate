import 'package:check_mate/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TaskTile extends StatelessWidget{


  final String taskTitle;
  final bool  isChecked;
  final  Function(bool?) checkboxCallback;
  const TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
        style: TextStyle(color: Colors.grey,decoration: isChecked? TextDecoration.lineThrough: null ),),
      trailing: Checkbox(
        activeColor: Colors.amber,
        value: isChecked,
        onChanged: checkboxCallback,


      ),

    );
  }
}
