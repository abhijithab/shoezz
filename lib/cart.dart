import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping list', style: GoogleFonts.poppins(fontSize: 17)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      height: 100,
                      width: 100,
          
                      child: Column(
                        children: [
                          Image.asset('assets/hoodie1-removebg-preview.png'),
                        ],
                      ),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
          
                          children: [
                            Text(
                              'Zipper Hoodie',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 65),
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 7,),
                            Icon(Icons.delete_sweep_outlined)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Align(alignment: Alignment.bottomLeft,
                          child: Row(
                            
                          
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(width: 87,),
                              Text('947.3€')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
                    Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      height: 100,
                      width: 100,
          
                      child: Column(
                        children: [
                          Image.asset('assets/image-3.png'),
                        ],
                      ),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
          
                          children: [
                            Text(
                              'Adidas shoes',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 70),
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 7,),
                            Icon(Icons.delete_sweep_outlined)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Align(alignment: Alignment.bottomLeft,
                          child: Row(
                            
                          
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(width: 87,),
                              Text('60.00€')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
                    Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      height: 100,
                      width: 100,
          
                      child: Column(
                        children: [
                          Image.asset('assets/image-1.png'),
                        ],
                      ),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
          
                          children: [
                            Text(
                              'Adidas Shoes',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 70),
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 7,),
                            Icon(Icons.delete_sweep_outlined)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Align(alignment: Alignment.bottomLeft,
                          child: Row(
                            
                          
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(width: 87,),
                              Text('59.50€')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cartScreen()),
                    );
                    // TODO: Add action when button is clicked
                    print("Added to List");
                  },
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
                    "Make a purchase",
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
    );
  }
}
