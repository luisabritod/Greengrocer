import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final String _image1 = 'assets/images/profile/avatar1.png';
  final String _image2 = 'assets/images/profile/avatar2.png';

  late String _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = _image1;
  }

  void _toggleImage() {
    setState(() {
      _selectedImage = _selectedImage == _image1 ? _image2 : _image1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthController().signOut();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: GestureDetector(
                onTap: _toggleImage,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(_selectedImage),
                  backgroundColor:
                      CustomColors.primaryGreenLight.withAlpha(100),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Name'),
                      subtitle: Text(authController.user.name ?? ''),
                      leading: const Icon(Icons.person),
                    ),
                    ListTile(
                      title: const Text('Email'),
                      subtitle: Text(authController.user.email ?? ''),
                      leading: const Icon(Icons.email),
                    ),
                    ListTile(
                      title: const Text('Phone'),
                      subtitle: Text(authController.user.phone ?? ''),
                      leading: const Icon(Icons.phone),
                    ),
                    ListTile(
                      title: const Text('CPF'),
                      subtitle: Text(authController.user.cpf ?? ''),
                      leading: const Icon(Icons.file_copy),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
