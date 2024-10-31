import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
// import 'package:greengrocer/scr/pages_routes/pages_routes.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColors.primaryGreenLighter,
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              icon: Icons.email,
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Email is required';
                                }
                                if (!email.isEmail) {
                                  return 'Invalid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.lock,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Password is required';
                                }
                                if (password.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.person,
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              keyboardType: TextInputType.name,
                              validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return 'Name is required';
                                }
                                final names = name.split(' ');
                                if (names.length == 1) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.phone,
                              hintText: 'Enter your phone number',
                              labelText: 'Phone',
                              keyboardType: TextInputType.phone,
                              validator: (phone) {
                                if (phone == null || phone.isEmpty) {
                                  return 'Phone is required';
                                }
                                if (!phone.isPhoneNumber) {
                                  return 'Invalid phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.file_copy,
                              hintText: 'Enter your CPF',
                              labelText: 'CPF',
                              keyboardType: TextInputType.number,
                              validator: (cpf) {
                                if (cpf == null || cpf.isEmpty) {
                                  return 'CPF is required';
                                }
                                if (!cpf.isCpf) {
                                  return 'Invalid CPF';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                                text: 'Sign Up',
                                onPressed: () {
                                  // Get.offNamed(PagesRoutes.base);
                                }),
                          ],
                        ),
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
