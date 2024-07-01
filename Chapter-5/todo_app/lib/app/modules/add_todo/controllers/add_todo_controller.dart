import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/models/todos.dart';
import 'package:todo_app/utils/DbHelper.dart';

class AddTodoController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var db = DbHelper();

  Future<void> addTodo(String title, String description) async {
    var todo = Todo(
      judul: title,
      deskripsi: description,
      isDone: false,
    );
    await db.insertTodo(todo);
    Get.snackbar(
      'Todo Added',
      'New todo has been added successfully!',
    );
  }

  Future<void> updateTodo(Todo todo) async {
    await db.update(todo);
    Get.snackbar('Success', 'Todo has been edited successfully!');
    Get.find<HomeController>().getTodos();
  }
}
