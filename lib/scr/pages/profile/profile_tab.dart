import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: CircleAvatar(
                radius: 100,
                backgroundImage:
                    const AssetImage('assets/images/profile/avatar2.png'),
                backgroundColor: CustomColors.primaryGreenLight.withAlpha(100),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                // padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  children: [
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text('John Doe'),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text('johndoe@email.com'),
                      leading: Icon(Icons.email),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      subtitle: Text('1234567890'),
                      leading: Icon(Icons.phone),
                    ),
                    ListTile(
                      title: Text('CPF'),
                      subtitle: Text('123.456.789.00'),
                      leading: Icon(Icons.file_copy),
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
