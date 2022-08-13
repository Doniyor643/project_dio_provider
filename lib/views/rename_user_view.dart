import 'package:flutter/material.dart';
import 'package:project_dio_provider/services/dio_service.dart';

  DioService dioService = DioService();

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Widget renameUser(String? title,String? body){
    titleController.text = title!;
    bodyController.text = body!;
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        const SizedBox(height: 30,),
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
              hintText: "title"
          ),
        ),
        const SizedBox(height: 30,),
        TextField(
          controller: bodyController,
          decoration: const InputDecoration(
              hintText: "body"
          ),
        ),
        const SizedBox(height: 40,),
        Container(
          height: 40,
          width: double.infinity,
          color: Colors.purpleAccent,
          child: ElevatedButton(
            onPressed: (){
              dioService.createNewUser(titleController.text,bodyController.text);
            },
            child: const Center(child: Text("Done"),),
          ),
        )
      ],
    );
  }