import 'package:get/get.dart';
import 'package:todo_app/models/todos.dart';
import 'package:todo_app/utils/DbHelper.dart';

class HomeController extends GetxController {
  var db = DbHelper();
  var todos = <Todo>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTodos() async {
    var todosList = await db.getTodos();
    todos.assignAll(todosList);
  }

  Future<void> insertTodo(Todo todo) async {
    await db.insertTodo(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await db.update(todo);
  }

  Future<void> delete(int id) async {
    await db.delete(id);
  }

  Future<void> deleteAll() async {
    await db.deleteAll();
  }

  Future<void> deleteDone() async {
    await db.deleteDone();
  }

  Future<void> toggleTodoStatus(int id, bool isDone) async {
    await db.isChecked(id);
    int index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].isDone = isDone;
      db.update(todos[index]);
    }
    getTodos();
  }
}
