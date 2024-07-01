import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_notification/app/data/medicine.dart';
import 'package:local_notification/app/data/notification.dart' as notif;
import 'package:local_notification/app/helper/db_helper.dart';
import 'package:local_notification/app/modules/home/controllers/home_controller.dart';
import 'package:local_notification/app/utils/notification_api.dart';

class AddScheduleController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController frequencyController;
  final List<TextEditingController> timeController =
      [TextEditingController()].obs;

  var db = DbHelper();
  final frequency = 0.obs;

  HomeController homeController = Get.put(HomeController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    NotificationApi.init();

    nameController = TextEditingController();
    frequencyController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void add(String name, int frequency) async {
    await db.insertMedicine(Medicine(name: name, frequency: frequency));

    var lastMedicineId = await db.getLastMedicineId();

    for (int i = 1; i <= frequency; i++) {
      await db.insertNotification(notif.Notification(
          idMedicine: lastMedicineId, time: timeController[i].text));
    }

    List<notif.Notification> notifications =
        await db.getNotificationsByMedicineId(lastMedicineId);

    for (var element in notifications) {
      NotificationApi.scheduledNotification(
        id: element.id!,
        title: "Waktunya minum obat $name",
        body: "Minum obat agar cepat sembuh :)",
        payload: name,
        scheduledDate: TimeOfDay(
          hour: int.parse(element.time.split(':')[0]),
          minute: int.parse(element.time.split(':')[1]),
        ),
      ).then((value) => print("notif ${element.id} scheduled"));
    }
    print("sukses?");
    homeController.getAllMedicineData();
    Get.back();
  }
}
