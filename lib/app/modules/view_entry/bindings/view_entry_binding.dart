import 'package:get/get.dart';

import '../controllers/view_entry_controller.dart';

class ViewEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewEntryController>(
      () => ViewEntryController(),
    );
  }
}
