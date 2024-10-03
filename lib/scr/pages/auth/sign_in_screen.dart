import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages_routes/pages_routes.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.primaryGreenLight,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextSpanAppName(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Fruits'),
                            FadeAnimatedText('Vegetables'),
                            FadeAnimatedText('Meat'),
                            FadeAnimatedText('Cereal'),
                            FadeAnimatedText('Dairy'),
                          ],
                        ),
                      ),
                    )
                  ],
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
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //email
                    const CustomTextField(
                      icon: Icons.email,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    //password
                    const CustomTextField(
                      icon: Icons.lock,
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      isPassword: true,
                      keyboardType: TextInputType.text,
                    ),
                    //login button
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.base);
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Or'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.signUp);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: CustomColors.primaryGreenLight,
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
