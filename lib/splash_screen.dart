import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezz/bottom_navigation.dart';
import 'package:shoezz/login.dart';
import 'package:shoezz/registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _SplashScreen();
  }


  Future<void> _SplashScreen() async{
    Future.delayed(Duration(seconds: 3),()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isloggedin = prefs.getBool('isloggedin')?? false;
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isloggedin? RegistrationScreen():BottomNavigationScreen()));
      }
    },);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ShoeZZ',style:TextStyle(fontFamily: 'Galano', fontSize: 70,color: const Color.fromARGB(255,213, 241,162),fontWeight: FontWeight.bold),),
            SizedBox(width: 20,),
            Image.asset('assets/STORES.png',height: 50,width: 50,color:  const Color.fromARGB(255,213, 241,162),)
          ],
        ),
        
      ),
    );
  }
}