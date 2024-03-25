import 'package:get/get.dart';

import '../controllers/recipes_by_category_controller.dart';

class RecipesByCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipesByCategoryController>(
      () => RecipesByCategoryController(),
    );
  }
}
