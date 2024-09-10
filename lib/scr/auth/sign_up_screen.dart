import 'package:flutter/material.dart';
import 'package:greengrocer/scr/auth/components/components.dart';
import 'package:greengrocer/scr/config/config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.email,
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            icon: Icons.lock,
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            icon: Icons.person,
                            hintText: 'Enter your name',
                            labelText: 'Name',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            icon: Icons.phone,
                            hintText: 'Enter your phone number',
                            labelText: 'Phone',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            icon: Icons.file_copy,
                            hintText: 'Enter your CPF',
                            labelText: 'CPF',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          CustomLoginButton(text: 'Sign Up', onPressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
