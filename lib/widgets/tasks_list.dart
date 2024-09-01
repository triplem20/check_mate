import 'package:check_mate/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../module/tasks.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  taskData.deleteTask(task);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('${task.taskName} deleted'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: TaskTile(
                isChecked: task.isDone,
                taskTitle: task.taskName,
                checkboxCallback: (checkboxState) {
                  setState(() {
                    taskData.updateTask(task);
                  });
                },

              ),
            );
          },
        );
      },
    );
  }
}

