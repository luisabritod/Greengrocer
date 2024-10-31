import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/services/services.dart';
// import 'package:greengrocer/scr/pages_routes/pages_routes.dart';
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
                            const CustomTextField(
                              icon: Icons.email,
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            const SizedBox(height: 10),
                            const CustomTextField(
                              icon: Icons.lock,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: passwordValidator,
                            ),
                            const SizedBox(height: 10),
                            const CustomTextField(
                              icon: Icons.person,
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              keyboardType: TextInputType.name,
                              validator: nameValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.phone,
                              hintText: 'Enter your phone number',
                              labelText: 'Phone',
                              inputFormatters: [phoneFormatter],
                              keyboardType: TextInputType.phone,
                              validator: phoneValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              icon: Icons.file_copy,
                              hintText: 'Enter your CPF',
                              labelText: 'CPF',
                              inputFormatters: [cpfFormatter],
                              keyboardType: TextInputType.number,
                              validator: cpfValidator,
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                                text: 'Sign Up',
                                onPressed: () {
                                  _formKey.currentState!.validate();
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
