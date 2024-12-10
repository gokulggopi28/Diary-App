import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Diary",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.entries.length,
          itemBuilder: (context, index) {
            final entry = controller.entries[index];
            final dateTime = DateTime.parse(entry['date']); 
            final formattedDate =
                DateFormat('MMM d, yyyy').format(dateTime);
            final formattedTime =
                DateFormat('h:mm a').format(dateTime); 

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                title: Text(
                  entry['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: $formattedDate',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Time: $formattedTime',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed('/view-entry', arguments: entry),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => controller.deleteEntry(entry['id']),
                ),
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
