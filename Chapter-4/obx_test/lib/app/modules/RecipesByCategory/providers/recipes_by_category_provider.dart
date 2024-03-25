import 'package:get/get.dart';

import '../recipes_by_category_model.dart';

class RecipesByCategoryProvider extends GetConnect {
  Future<RecipesByCategoryModels> getRecipeByCategory(String category) async {
    final response = await get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return RecipesByCategoryModels.fromJson(
          response.body as Map<String, dynamic>);
    }
  }
}
