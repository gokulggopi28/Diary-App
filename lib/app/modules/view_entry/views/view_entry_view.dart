import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_entry_controller.dart';

class ViewEntryView extends GetView<ViewEntryController> {
  const ViewEntryView({super.key});
  @override
  Widget build(BuildContext context) {
    
    final entry = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('View Entry'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry['title'] ?? "No Title", 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18, color: Colors.grey,),
                const SizedBox(
                  width: 8,
                ),
                Text(entry['date'] ?? "UnKnown  Date",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
           Expanded(
              child: SingleChildScrollView(
                child: Text(
                  entry['content'] ?? "No Content",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
