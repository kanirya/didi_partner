import 'package:didi_partner/view_model/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(ap.ownerModel.uid),
          Text(ap.ownerModel.phone),
          Text(ap.ownerModel.name),
        ],),
      ),
    );
  }
}
