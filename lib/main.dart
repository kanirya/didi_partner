
import 'package:didipartner/view/splash.dart';
import 'package:didipartner/view_model/provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),  // Replace YourProvider with the actual provider class
      child: MaterialApp(   // or GetMaterialApp if you are using GetX
        debugShowCheckedModeBanner: false,
        title: 'DIDI Partner',
        home: splash(),

      ),
    );
  }
}