
import 'dart:async';

import 'package:didipartner/view/screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/provider/provider.dart';
import 'Auth/login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ap = Provider.of<AuthProvider>(context, listen: false);


    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
     if (ap.isSignedIn == true) {
        await ap.getDataFromSP().whenComplete(
              () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        );
      } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}