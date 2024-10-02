import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/pages.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
          pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutQuart,
          );
        }),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: CustomColors.primaryGreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
    );
  }
}
