import 'package:get/get.dart';

import '../../../services/database_service.dart';


class AddEntryController extends GetxController {
  Future<void> addEntry(String title, String content) async {
    final entry = {
      'title': title,
      'content': content,
      'date': DateTime.now().toIso8601String(),
    };
    await DatabaseService.addEntry(entry);
    Get.back();
  }
}
