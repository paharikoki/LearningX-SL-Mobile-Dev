import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recipes_by_category_controller.dart';

class RecipesByCategoryView extends GetView<RecipesByCategoryController> {
  final RecipesByCategoryController _recipesByCategoryController =
      Get.put(RecipesByCategoryController());
  RecipesByCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.arguments} Recipes'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_recipesByCategoryController.isLoading.value) {
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
        } else if (_recipesByCategoryController.isError.value) {
          return const Center(child: Text('Error fetching data'));
        } else if (_recipesByCategoryController.meals.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return GridView.builder(
            itemCount: _recipesByCategoryController.meals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 330),
            itemBuilder: (context, index) {
              final category = _recipesByCategoryController.meals[index];

              return GestureDetector(
                onTap: () {
                  print("${category.strMeal} clicked");
                  Get.toNamed('/recipes-by-category',
                      arguments: '${category.strMeal}');
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        category.strMealThumb ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          category.strMeal ?? 'No Name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
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
