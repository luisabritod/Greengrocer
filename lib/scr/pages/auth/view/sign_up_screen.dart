import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/auth/auth.dart';
import 'package:greengrocer/scr/services/services.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

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
                              onSaved: (value) {
                                authController.user.email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.lock,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              onSaved: (value) {
                                authController.user.password = value;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: passwordValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.person,
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              onSaved: (value) {
                                authController.user.name = value;
                              },
                              keyboardType: TextInputType.name,
                              validator: nameValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.phone,
                              hintText: 'Enter your phone number',
                              labelText: 'Phone',
                              onSaved: (value) {
                                authController.user.phone = value;
                              },
                              inputFormatters: [phoneFormatter],
                              keyboardType: TextInputType.phone,
                              validator: phoneValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.file_copy,
                              hintText: 'Enter your CPF',
                              labelText: 'CPF',
                              onSaved: (value) {
                                authController.user.cpf = value;
                              },
                              inputFormatters: [cpfFormatter],
                              keyboardType: TextInputType.number,
                              validator: cpfValidator,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: Obx(() => ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        CustomColors.primaryGreenLight),
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                  ),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            authController.signUp();
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'Sign Up',
                                          style: TextStyle(fontSize: 18),
                                        ))),
                            ),
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
