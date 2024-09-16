
import 'dart:async';

import 'package:didi_partner/view/Auth/login.dart';
import 'package:didi_partner/view/screens/Home_screen.dart';
import 'package:didi_partner/view_model/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                builder: (context) => const homeScreen(),
              ),
            );
          },
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}