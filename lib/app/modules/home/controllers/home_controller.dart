import 'package:get/get.dart';

import '../../../services/database_service.dart';

class HomeController extends GetxController {
  var entries = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEntries();
  }

  Future<void> fetchEntries() async {
    isLoading(true);
    entries.value = await DatabaseService.fetchEntries();
    isLoading(false);
  }

  Future<void> deleteEntry(int id) async {
    await DatabaseService.deleteEntry(id);
    fetchEntries();
  }
}
