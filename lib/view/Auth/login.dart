
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import '../../utils/utils.dart';
import '../../view_model/provider/provider.dart';
import '../screens/Home_screen.dart';
import 'List_proterty.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  bool _isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
   bool load=false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 130,
              child: SvgPicture.asset(
                'assets/images/DIDIpartner.svg',
                height: 50,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListProterty()));
            },
            child: Text(
              'List property',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.language, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(maxWidth: 400, minWidth: 350),
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ListView(
                  reverse: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle Terms of use
                          },
                          child: Text(
                            'Terms of use',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Text(
                          ' and ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle Privacy policy
                          },
                          child: Text(
                            'Privacy policy',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Center(
                        child: Text(
                          'By logging into the account you are agreeing with our',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed:
                      (){verifyEmail(context);}

                      ,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child:isLoading==true?CircularProgressIndicator(color: Colors.white,) :Text(
                          'Login',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Handle password reset
                        },
                        child: Text(
                          'Generate a new password',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(width: 2, color: Colors.black)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Id / Phone Number',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(width: 2, color: Colors.black)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Enter the registered email address or phone number associated with us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome to DIDI Partner',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }






void   verifyEmail(BuildContext context) {

    final ap = Provider.of<AuthProvider>(context, listen: false);

    print('Starting verifyEmail');  // Debugging Step 1

    ap.signInWithEmail(
      context: context,
      email: _emailController.text.toString(),
      password: _passwordController.text.toString(),
      onSuccess: () {
        print('Sign-in successful, checking if user exists');  // Debugging Step 2

        ap.checkExistingUser().then((exists) async {
          if (exists) {
            print('User exists in Firestore, fetching data');  // Debugging Step 3
            // Fetch data from Firestore
            ap.getDataFromFireStore().then(
                  (value) {
                // Save data locally in SharedPreferences
                ap.saveOwnerDataToSP().then(
                      (value) {
                    print('Data saved in SharedPreferences, setting sign-in state');  // Debugging Step 4
                    // Set sign-in state
                    ap.setSignIn().then(
                          (value) {
                        print('Sign-in state set, navigating to home screen');  // Debugging Step 5
                        // Navigate to home screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                              (route) => false,
                        );
                      },
                    );
                  },
                );
              },
            );
          } else {
            print('User does not exist in Firestore');  // Debugging Step 6
            showSnackBar(context, "User does not exist in Firestore.");
          }
        }).catchError((error) {
          print('Error while checking user existence: $error');  // Debugging Step 7
        });
      },
    );
  }

 }