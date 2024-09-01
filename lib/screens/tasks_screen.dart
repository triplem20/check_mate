import 'package:check_mate/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../module/tasks.dart';
import '../widgets/tasks_list.dart';
import 'addtask_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30,top: 60,right: 30,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                <Widget>[

                  CircleAvatar(

                    child: Icon(Icons.list,size: 30,),
                    radius: 30
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("CheckMate",style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.w700),),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("images/checkmate_logo.png")),
                        ),
                      ),
                  
                    ],
                  ),
                  Text("${Provider.of<TaskData>(context).taskCount} Tasks",style: TextStyle(fontSize: 18,color: Colors.black),),

                ],

            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal:20 ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          child: Icon(Icons.add,size: 30),
          onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen());

          }
      ),
    );
  }
}




