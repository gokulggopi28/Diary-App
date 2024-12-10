import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_entry_controller.dart';

class ViewEntryView extends GetView<ViewEntryController> {
  const ViewEntryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewEntryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewEntryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
