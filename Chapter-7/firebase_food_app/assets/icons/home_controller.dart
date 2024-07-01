import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_food_app/app/data/Food.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final buttonText = [
    "All",
    "Makanan",
    "Kuah",
    "Minuman",
  ];

  final iconButton = [
    "assets/icons/all.png",
    "assets/icons/makanan.png",
    "assets/icons/kuah.png",
    "assets/icons/minuman.png",
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<List<Food>> readRecipe(String jenis) {
    if (jenis != "All") {
      return FirebaseFirestore.instance
          .collection('foods')
          .where('jenis', isEqualTo: jenis)
          .snapshots()
          .map((snapshot) =>
              snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
    } else {
      return FirebaseFirestore.instance.collection('foods').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
    }
  }

  Stream<List<Food>> searchFood(String search) {
    return FirebaseFirestore.instance
        .collection('foods')
        .where('nama', isGreaterThanOrEqualTo: search)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
  }
}
