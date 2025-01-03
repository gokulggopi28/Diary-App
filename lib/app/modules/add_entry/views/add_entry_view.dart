import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_entry_controller.dart';

class AddEntryView extends GetView<AddEntryController> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  AddEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Diary Entry",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color.fromARGB(255, 11, 46, 63),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                         style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Title",
                           hintStyle: TextStyle(color: Colors.white), 
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Content",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: contentController,
                         style: const TextStyle(color: Colors.white),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: "Write your thoughts here...",
                           hintStyle: TextStyle(color: Colors.white), 
                          border: OutlineInputBorder(
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: Colors.blue,
                  ),
                  icon: const Icon(Icons.save,color: Colors.white,),
                  label: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                   
                    if (titleController.text.isEmpty ||
                        contentController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Both title and content are required!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    controller.addEntry(
                      titleController.text,
                      contentController.text,
                    );

                    Get.snackbar(
                      "Success",
                      "Diary entry saved!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );

                    titleController.clear();
                    contentController.clear();
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
