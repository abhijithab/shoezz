import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezz/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartProducts = [];
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList('cart') ?? [];

    setState(() {
      cartProducts =
          cartList
              .map((item) => jsonDecode(item))
              .cast<Map<String, dynamic>>()
              .toList();
      calculateTotalPrice();
    });
  }

  void calculateTotalPrice() {
    double total = 0.0;
    for (var product in cartProducts) {
      total += product['qty'] * product['price'];
    }
    setState(() {
      totalPrice = total;
    });
  }

  void updateQuantity(int index, int change) async {
    setState(() {
      cartProducts[index]['qty'] += change;
      if (cartProducts[index]['qty'] < 1) {
        cartProducts[index]['qty'] = 1;
      }
      calculateTotalPrice();
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedCart =
        cartProducts.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('cart', updatedCart);
  }

  void removeItem(int index) async {
    setState(() {
      cartProducts.removeAt(index);
      calculateTotalPrice();
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedCart =
        cartProducts.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('cart', updatedCart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart', style: GoogleFonts.poppins(fontSize: 17)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
      ),
      body:
          cartProducts.isEmpty
              ? Center(
                child: Text(
                  'Your cart is empty!',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        final product = cartProducts[index];

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Image.asset(product['image'], width: 80),
                              ),
                              title: Text(
                                product['name'],
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price: ${(product['price'] * product['qty']).toStringAsFixed(2)}€',
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed:
                                            () => updateQuantity(index, -1),
                                        icon: Icon(Icons.remove_circle_outline),
                                      ),
                                      Text(product['qty'].toString()),
                                      IconButton(
                                        onPressed:
                                            () => updateQuantity(index, 1),
                                        icon: Icon(Icons.add_circle_outline),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () => removeItem(index),
                                icon: Icon(Icons.delete_sweep_outlined),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                    ),
                    onPressed: () {
                      Navigator.pop(context);                    },
                    child: Text(
                      'Back to shop',
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total: ${totalPrice.toStringAsFixed(2)}€',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            50,
                          ), // ✅ Adds padding around button
                          child: SizedBox(
                            width: double.infinity, // ✅ Makes button full-width
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  213,
                                  241,
                                  162,
                                ), // ✅ Button color black
                                foregroundColor:
                                    Colors.black, // ✅ Text color white
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    13,
                                  ), // ✅ Rounded corners
                                ),
                              ),
                              child: Text(
                                "buy now",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
