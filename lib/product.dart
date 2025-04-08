import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezz/card.dart';
import 'package:shoezz/cart.dart';

class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<void> addtolist() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> cartList = prefs.getStringList('cart') ?? [];

  Map<String, dynamic> product = {
    'image': widget.product['image'],
    'name': widget.product['name'],
    'price': widget.product['price'],
    'qty': 1, // Default quantity
  };

  cartList.add(jsonEncode(product)); // Convert map to JSON string
  await prefs.setStringList('cart', cartList);

  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
}


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // ✅ Required for TabBar & TabBarView
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context); // ✅ Goes back to the last page
            },
            icon: Icon(Icons.keyboard_arrow_left_rounded),
          ),
          title: Text('Special Offers'),
        ),

        body: Column(
          children: [
            // ✅ Main Product Image
            Container(child: Image.asset(widget.product['image'], height: 250)),
            SizedBox(height: 10),

            // ✅ Product Variants
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: index == 1 ? Colors.grey.shade300 : Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Image.asset(
                      widget.product['image'],
                      fit: BoxFit.contain,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),

            // ✅ Product Info
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product['name']}\n (black)",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${widget.product['price']} €",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ TabBar with Proper Padding & Black-White Theme
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ), // ✅ Adds padding to TabBar
              child: Container(
                height: 50, // ✅ Adjusted height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.black, // ✅ Background color is black
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      213,
                      241,
                      162,
                    ), // ✅ Selected tab background is greenish-white
                    borderRadius: BorderRadius.circular(13),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                  labelColor: Colors.black, // ✅ Selected text is black
                  unselectedLabelColor:
                      Colors.white, // ✅ Unselected text is white
                  tabs: [
                    Tab(
                      child: Text(
                        'Card',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Remove',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Catalog',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Share',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ TabBarView (Below the TabBar)
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      "Card Content",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ), // Dummy content
                  Center(
                    child: Text(
                      "Remove Content",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ), // Dummy content
                  Center(
                    child: Text(
                      "Catalog Content",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ), // Dummy content
                  Center(
                    child: Text(
                      "Share Content",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ), // Dummy content
                ],
              ),
            ),

            // ✅ "Add to List" Button at the Bottom
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
                  onPressed: addtolist, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      213,
                      241,
                      162,
                    ), // ✅ Button color black
                    foregroundColor: Colors.black, // ✅ Text color white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        13,
                      ), // ✅ Rounded corners
                    ),
                  ),
                  child: Text(
                    "Add to List",
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
    );
  }
}
