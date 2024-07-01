import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_notification/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.listMedicines.isEmpty) {
            return const Center(
              child: Text(
                'Data Kosong',
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listMedicines.length,
              itemBuilder: (context, index) {
                final medicine = controller.listMedicines[index];
                return ListTile(
                  title: Text(medicine.name),
                  subtitle:
                      Text("${medicine.frequency.toString()} kali sehari"),
                  onTap: () => Get.toNamed(Routes.DETAIL_MEDICINE,
                      arguments: medicine.id),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_SCHEDULE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
