import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/presentation/views/create_task_view.dart';
import 'package:task_manager/presentation/views/settings_view.dart';
import 'package:task_manager/presentation/views/task_list_view.dart';
// Settings screen

class MainNavigationController extends GetxController {
  // Keeps track of the current page index
  var currentIndex = 1.obs;

  // List of pages to navigate to
  final List<Widget> pages = [
    CreateTaskView(),
    const TaskListView(), // Middle page (Home)
    const SettingsView(),
  ];

  // Change the current index when a bottom navigation tab is selected
  void changePage(int index) {
    currentIndex.value = index;
  }
}

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavigationController controller =
        Get.put(MainNavigationController());

    // Icon List for the Bottom Navigation
    final List<IconData> iconList = [
      Icons.add,
      Icons.list,
      Icons.settings,
    ];

    return Obx(() => Scaffold(
          body: controller.pages[controller.currentIndex.value],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.changePage(1); // Go to the middle (Tasks) page
            },
            child: const Icon(Icons.home),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: controller.currentIndex.value,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) {
              controller.changePage(index);
            },
            backgroundColor: Colors.blueAccent,
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
        ));
  }
}
