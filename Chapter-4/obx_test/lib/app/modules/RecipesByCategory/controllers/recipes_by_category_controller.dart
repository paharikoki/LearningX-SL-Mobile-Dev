// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:obx_test/app/modules/RecipesByCategory/providers/recipes_by_category_provider.dart';
import 'package:obx_test/app/modules/RecipesByCategory/recipes_by_category_model.dart';

class RecipesByCategoryController extends GetxController {
  final RecipesByCategoryProvider _categoryProvider =
      Get.put(RecipesByCategoryProvider());

  var meals = <Meals>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  late String category = 'Seafood';
  @override
  void onInit() {
    super.onInit();
    category = Get.arguments as String;
    fetchRecipesByCategory(category);
  }

  void fetchRecipesByCategory(String category) async {
    try {
      isLoading(true);
      this.category = category;
      final mealsData = await _categoryProvider.getRecipeByCategory(category);
      meals.assignAll(mealsData.meals!);
      isError(false);
    } catch (e) {
      isError(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
