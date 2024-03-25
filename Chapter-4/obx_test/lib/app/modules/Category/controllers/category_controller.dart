// category_controller.dart
// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:obx_test/app/modules/Category/category_model.dart';
import 'package:obx_test/app/modules/Category/providers/category_provider.dart';

class CategoryController extends GetxController {
  final CategoryProvider _categoryProvider = Get.put(CategoryProvider());

  var categories = <Category>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    try {
      isLoading(true);
      final categoryData = await _categoryProvider.getCategory();
      categories.assignAll(categoryData.categories!);
      isError(false);
    } catch (e) {
      isError(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  favoriteButtonPressed() {
    isFavorite.value = !isFavorite.value;
    if (isFavorite.value) {
      print('Favorite button pressed');
    } else {
      print('Favorite button unpressed');
    }
  }
}
