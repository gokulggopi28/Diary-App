import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Diary")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.entries.length,
          itemBuilder: (context, index) {
            final entry = controller.entries[index];
            return ListTile(
              title: Text(entry['title']),
              subtitle: Text(entry['date']),
              onTap: () => Get.toNamed('/view-entry', arguments: entry),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.deleteEntry(entry['id']),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed('/add-entry'),
      ),
      backgroundColor: Colors.white,
    );
  }
}
