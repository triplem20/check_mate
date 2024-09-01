import 'package:check_mate/module/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../module/tasks.dart';


class AddTaskScreen extends StatelessWidget {




final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
       ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            TextField(
              controller: controller,
              autofocus: true,
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 350,
              child: FloatingActionButton(
                  backgroundColor: Colors.amber,
                  child: Center(child: Text('Add')),
                  onPressed: (){
                    Provider.of<TaskData>(context,listen: false).addNewTask(controller.text);
                    Navigator.pop(context);

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
