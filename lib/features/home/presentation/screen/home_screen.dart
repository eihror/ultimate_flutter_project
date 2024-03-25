import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_controller.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_ui_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.onUiEvent(event: OnInitScreen());

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.userNameTextEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (context, index) {
                    final repo = controller.uiState.githubRepoList[index];
                    return ListTile(
                      title: Text(repo.name),
                      subtitle: Text(repo.description),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: controller.uiState.githubRepoList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
