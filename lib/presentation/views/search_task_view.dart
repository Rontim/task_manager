import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/presentation/controllers/task_controller.dart';

class SearchTaskView extends StatelessWidget {
  const SearchTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await taskController.searchTaskByTitle(
                'Attend personal training session on Thursday morning');
            Get.back();
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
