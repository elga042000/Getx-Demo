import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/user_controller.dart';
import 'package:getx_demo/user.dart';

void main() {
  runApp(const GetxDemo());
}

class GetxDemo extends StatelessWidget {
  const GetxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Getx Demo'),
        ),
        body: Center(
          child: GetX<UserController>(
            init: UserController(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  User user = controller.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
