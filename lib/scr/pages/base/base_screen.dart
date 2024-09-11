import 'package:flutter/material.dart';
import 'package:greengrocer/scr/pages/home/home.dart';

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
          pageController.jumpToPage(value);
        }),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
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
        children: [
          const HomeTab(),
          Container(
            color: Colors.green,
            child: Image.asset('assets/images/fruits/apple.png'),
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
