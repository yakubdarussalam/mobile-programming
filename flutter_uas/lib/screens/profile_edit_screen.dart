// profile_edit_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_uas/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_uas/models/user_model.dart';

class ProfileEditScreen extends StatelessWidget {
  final User user;

  ProfileEditScreen({Key? key, required this.user}) : super(key: key);

  final UserController controller = Get.find<UserController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    addressController.text = user.address;
    ageController.text = user.age.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedUser = User(
                  id: user.id,
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  address: addressController.text,
                  age: int.parse(ageController.text),
                  image: user.image,
                  position: user.position,
                  connection: user.connection,
                  experience: user.experience,
                  status: user.status,
                );

                // Call updateUser in UserController with updatedUser
                bool success = await controller.updateUser(updatedUser);

                if (success) {
                  await controller.refreshUser(user.id);
                  Get.back(); // Return to the profile screen
                  Get.snackbar("Success", "Profile updated successfully",
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  Get.snackbar("Error", "Failed to update profile",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
