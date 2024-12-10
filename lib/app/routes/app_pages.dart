import 'package:get/get.dart';

import '../modules/add_entry/bindings/add_entry_binding.dart';
import '../modules/add_entry/views/add_entry_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/view_entry/bindings/view_entry_binding.dart';
import '../modules/view_entry/views/view_entry_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ENTRY,
      page: () => AddEntryView(),
      binding: AddEntryBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ENTRY,
      page: () => const ViewEntryView(),
      binding: ViewEntryBinding(),
    ),
  ];
}
