import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  final CategoryController _categoryController = Get.put(CategoryController());

  CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Search by Categories'),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )),
      body: Obx(() {
        if (_categoryController.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Loading...', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          );
        } else if (_categoryController.isError.value) {
          return const Center(child: Text('Error fetching data'));
        } else if (_categoryController.categories.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: _categoryController.categories.length,
            itemBuilder: (context, index) {
              final category = _categoryController.categories[index];
              // ignore: avoid_print
              if (category.strCategory == 'Breakfast' ||
                  category.strCategory == 'Goat') {
                return const SizedBox.shrink(); // Skip this item
              }
              return GestureDetector(
                onTap: () {
                  print("${category.strCategory} clicked");
                  Get.toNamed('/recipes-by-category',
                      arguments: '${category.strCategory}');
                },
                child: Stack(
                  children: [
                    // Content container with transparent background and gradient border
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(children: [
                        Positioned(
                          top: 50,
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            width: 240,
                            height: 150,
                            child: Image.network(
                              category.strCategoryThumb ?? '',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    // Positioned text widget at the top left corner
                    Positioned(
                      top: 20,
                      left: 50,
                      child: Text(
                        category.strCategory ?? 'No Name',
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
