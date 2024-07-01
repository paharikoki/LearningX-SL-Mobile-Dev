import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteDone();
                      controller.getTodos();
                    },
                    child: const Text('Delete Done'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteAll();
                      controller.getTodos();
                    },
                    child: const Text('Delete All'),
                  ),
                ],
              ),
              Expanded(
                child: Obx(() {
                  if (controller.todos.isEmpty) {
                    return const Center(
                      child: Text(
                        'No todos available',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 3, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: const Offset(
                                      0, 3), // Offset position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.todos[index].judul),
                                          Text(controller
                                              .todos[index].deskripsi),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: controller
                                                  .todos[index].isDone,
                                              onChanged: (value) {
                                                controller.toggleTodoStatus(
                                                  controller.todos[index].id ??
                                                      0,
                                                  value!,
                                                );
                                              }),
                                          IconButton(
                                              onPressed: () {
                                                controller.delete(controller
                                                        .todos[index].id ??
                                                    0);
                                                controller.getTodos();
                                              },
                                              icon: Icon(Icons.delete))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  child: SizedBox(
                                    width: 10,
                                    height: double.infinity,
                                    child: Container(
                                      color: controller.todos[index].isDone
                                          ? Colors.green
                                          : Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // return ListView.builder(
                    //   itemCount: controller.todos.length,
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //       onTap: () {
                    //         Get.toNamed(Routes.ADD_TODO,
                    //             arguments: controller.todos[index]);
                    //       },
                    //       child: ListTile(
                    //         title: Text(controller.todos[index].judul),
                    //         subtitle: Text(controller.todos[index].deskripsi),
                    //         trailing: Checkbox(
                    //           value: controller.todos[index].isDone,
                    //           onChanged: (value) {
                    //             controller.toggleTodoStatus(
                    //               controller.todos[index].id ?? 0,
                    //               value!,
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  }
                }),
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigate to AddTodoView and wait for result
            var result = await Get.toNamed(Routes.ADD_TODO);
            // Check if result is true, indicating that a todo was added
            if (result == true) {
              // Refresh todos if a todo was added
              controller.getTodos();
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
