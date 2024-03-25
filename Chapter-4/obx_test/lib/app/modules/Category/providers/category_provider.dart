import 'package:get/get.dart';
import '../category_model.dart';

class CategoryProvider extends GetConnect {
  Future<CategoryModel> getCategory() async {
    final response =
        await get('https://www.themealdb.com/api/json/v1/1/categories.php');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return CategoryModel.fromJson(response.body as Map<String, dynamic>);
    }
  }
}
