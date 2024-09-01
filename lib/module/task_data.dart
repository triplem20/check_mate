import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [

    Task(taskName: "Buy Milk"),
    Task(taskName: "Buy shoes"),
    Task(taskName: "Buy a bag of chips"),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

   int get taskCount {
     return
     _tasks.length;
   }
   void addNewTask(String newTask) {
     final task = Task(taskName: newTask);
     _tasks.add(task);
     notifyListeners();
   }
   void updateTask(Task task){

    task.toggleDone();
     notifyListeners();
   }

   void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
   }

  }

