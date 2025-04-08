import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoezz/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // Widget carouselImage(String value) {
  //   return Container(
  //     margin: EdgeInsets.all(6),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(image: AssetImage(value), fit: BoxFit.cover),
  //     ),
  //   );
  // }
  int _currentIndex = 0;

  final List<Map<String, dynamic>> imageList = [
    {
      'path': 'assets/red-removebg-preview.png',
      'color': const Color.fromARGB(255, 213, 241, 162),
    },
    {
      'path': 'assets/orange-removebg-preview.png',
      'color': Color.fromARGB(255, 247, 227, 227),
    },
    {
      'path': 'assets/green.png',
      'color': const Color.fromARGB(255, 162, 205, 242),
    },
    {
      'path': 'assets/green-running-shoes-png-24.png',
      'color': const Color.fromARGB(255, 243, 221, 245),
    },
  ];

  final List<Map<String, dynamic>> adidasList = [
    {
      'path': 'assets/orange-removebg-preview.png',
      'color': Color.fromARGB(255, 247, 227, 227),
    },
    {
      'path': 'assets/green-running-shoes-png-24.png',
      'color': const Color.fromARGB(255, 243, 221, 245),
    },
  ];
  final List<Map<String, dynamic>> iconsList = [
    {'path': 'assets/adidasicon.png',
    'color':Colors.grey[350]},
    {'path': 'assets/puma.png','color':Colors.grey[350]},
    {'path': 'assets/nike.png','color':Colors.grey[350]},
  ];

  final List<String> brandList=[
    'assets/adidasicon.png',
    'assets/puma.png',
    'assets/nike.png',
    'assets/new-balance.png',
    'assets/fila.png',

  ];

  final List<String> brandname=[
    'Adidas',
    'Puma',
    'Nike',
    'NewBalance',
    'Fila'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Builder(
                  builder:
                      (context) => IconButton(
                        icon: Icon(Icons.clear_all),

                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on_outlined),
                ),
                Text("Paris"),
              ],
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Shoezz',
                style: GoogleFonts.poppins(color:  const Color.fromARGB(255, 213, 241, 162), fontSize: 30),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginscreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Search...',
                        //labelText: ' Email Address',
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    width: 50,
                    height: 50,
                    child: Icon(FluentIcons.options_16_regular),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CarouselSlider(
                items:
                    imageList.map((imageData) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal:10),
                        decoration: BoxDecoration(
                          color: imageData['color'],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Image.asset(
                              imageData['path'],
                              fit: BoxFit.contain,
                              width: 800,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              SizedBox(height: 10),

              // *Smooth Page Indicator*
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: imageList.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  paintStyle: PaintingStyle.fill,
                ),
              ),

              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your favorite stores',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(padding:EdgeInsets.fromLTRB(0,0,0,0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index){
                      return Padding(padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey[200]
                                
                              ),
                              padding: EdgeInsets.fromLTRB(0,0,0,0),
                              child: Image.asset(brandList[index],fit: BoxFit.contain,),
                            ),
                          ),
                          SizedBox(height: 5,),
                          SizedBox(
                            height: 20,
                            child: Text(brandname[index],style: GoogleFonts.poppins(fontSize: 11,),),
                          )

                        ],
                      ),);
                      
                    })

                      

                    
                      
                      // List.generate(5, (index))],
                  ),
                ),
                ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New catalogs for you',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:
                        adidasList.map((adidasList) {
                          return Expanded(
                            child: AspectRatio(
                              aspectRatio: 1, // ✅ Ensures both images are equal
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                decoration: BoxDecoration(
                                  color: adidasList['color'],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    adidasList['path'],
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
