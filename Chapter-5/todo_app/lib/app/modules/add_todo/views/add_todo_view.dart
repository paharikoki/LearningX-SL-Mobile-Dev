import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/models/todos.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Todo? todo = Get.arguments;
    bool isEdit = todo != null;
    if (todo != null) {
      controller.titleController.text = todo.judul;
      controller.descriptionController.text = todo.deskripsi;
      isEdit = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTodoView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isEdit) {
                  controller.updateTodo(
                    Todo(
                      id: todo!.id,
                      judul: controller.titleController.text,
                      deskripsi: controller.descriptionController.text,
                      isDone: todo.isDone,
                    ),
                  );
                } else {
                  controller.addTodo(
                    controller.titleController.text,
                    controller.descriptionController.text,
                  );
                }

                Get.back(result: true);
              },
              child: Text(isEdit ? 'Save Changes' : 'Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
