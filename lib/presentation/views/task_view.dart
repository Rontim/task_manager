import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/presentation/controllers/task_controller.dart';
import 'package:task_manager/presentation/views/search_task_view.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.search_rounded, color: Colors.white),
          onPressed: () => Get.to(
            () => const SearchTaskView(),
          ),
        ),
        title: Text(
          'Task List',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => {taskController.pagingController.refresh()},
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedListView<int, Task>(
          pagingController: taskController.pagingController,
          physics: const CarouselScrollPhysics(),
          builderDelegate: PagedChildBuilderDelegate<Task>(
            itemBuilder: (context, task, index) => TaskTile(
              task: task,
              onSelect: () {
                taskController.selectTask(task);
              },
              controller: taskController,
            ),
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                strokeWidth: 2,
                strokeCap: StrokeCap.round,
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('No tasks available'),
            ),
            newPageErrorIndicatorBuilder: (context) => const Center(
              child: Text('Error loading tasks'),
            ),
          ),
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onSelect;
  final TaskController controller;

  const TaskTile({
    super.key,
    required this.task,
    required this.onSelect,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onSelect,
      leading: Icon(
        task.id == controller.selectedTaskId?.value
            ? Icons.check_circle
            : Icons.radio_button_unchecked,
        color: task.completed ? Colors.blueAccent : Colors.grey,
        size: 28,
      ),
      title: Text(
        task.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        task.description,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        task.completed ? 'Completed' : 'Pending',
        style: TextStyle(
          fontSize: 12,
          color: task.completed ? Colors.green : Colors.red,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.blueAccent.withOpacity(0.3),
          width: 1,
        ),
      ),
    );
  }
}
