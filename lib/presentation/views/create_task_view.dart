import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/domain/entities/category.dart';
import 'package:task_manager/domain/entities/priority.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/presentation/controllers/create_task_controller.dart';

class CreateTaskView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateTaskController controller =
        Get.put<CreateTaskController>(CreateTaskController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Task',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Task Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),

            // Title Text Field
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.title, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 16.0),

            // Description Text Field
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.description, color: Colors.teal),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),

            // Category Dropdown
            Obx(() => DropdownButtonFormField<Category>(
                  decoration: InputDecoration(
                    labelText: "Select Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.category, color: Colors.teal),
                  ),
                  value: controller.selectedCategory.value.id != 0
                      ? controller.selectedCategory.value
                      : null,
                  items: controller.categories.map((category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (Category? newCategory) {
                    if (newCategory != null) {
                      controller.selectCategory(newCategory);
                    }
                  },
                )),
            const SizedBox(height: 16.0),

            // Priority Dropdown
            Obx(() => DropdownButtonFormField<Priority>(
                  decoration: InputDecoration(
                    labelText: "Select Priority",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon:
                        const Icon(Icons.priority_high, color: Colors.teal),
                  ),
                  value: controller.selectedPriority.value.id != 0
                      ? controller.selectedPriority.value
                      : null,
                  items: controller.priorites.map((priority) {
                    return DropdownMenuItem<Priority>(
                      value: priority,
                      child: Text(priority.name),
                    );
                  }).toList(),
                  onChanged: (Priority? newPriority) {
                    if (newPriority != null) {
                      controller.selectPriority(newPriority);
                    }
                  },
                )),
            const SizedBox(height: 24.0),

            // Create Task Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (controller.selectedCategory.value.id == 0 ||
                      controller.selectedPriority.value.id == 0) {
                    Get.snackbar(
                        'Error', 'Please select a category and priority');
                    return;
                  }

                  final newTask = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    completed: false,
                    updatedAt: DateTime.now().toIso8601String(),
                    userId: controller.userId.value,
                    categoryId: controller.selectedCategory.value.id,
                    priorityId: controller.selectedPriority.value.id,
                  );

                  controller.createTask(newTask);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[2],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 24.0),
                ),
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  "Create Task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
