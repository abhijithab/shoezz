import 'package:flutter/material.dart';
import 'package:shoezz/card.dart';
import 'package:shoezz/cart.dart';
import 'package:shoezz/home.dart';
import 'package:shoezz/stores.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedindex = 0;
  List<Widget> widgetOptions = [
    homeScreen(),
    cardScreen(),
    cartScreen(),
    storesScreen(),
    homeScreen(),
  ];

  void _onltemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _onltemTapped,
        backgroundColor: Theme.of(context).primaryColor,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,

            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.payment_rounded),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.storefront_outlined),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.percent_sharp),
            label: 'Bons',
          ),
        ],
      ),
      body: widgetOptions.elementAt(_selectedindex),
    );
  }
}
