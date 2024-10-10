import 'package:country_picker/country_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ListProterty extends StatefulWidget {
  const ListProterty({super.key});

  @override
  State<ListProterty> createState() => _ListProtertyState();
}

class _ListProtertyState extends State<ListProterty> {
  String selectedOption = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Country selectedCountry = Country(
    phoneCode: "92",
    countryCode: "PK",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Pakistan",
    example: "Pakistan",
    displayName: "Pakistan",
    displayNameNoCountryCode: "PK",
    e164Key: "",
  );

  void _submitForm() async {
    int id=generateUniqueValue();
    TimeOfDay now = TimeOfDay.now();

    // Format the time as HH:MM
    String formattedTime = now.format(context);
    final ref = FirebaseDatabase.instance.ref('Partners').child('CallRequest').child(id.toString());
    if (_formKey.currentState?.validate() ?? false) {
      if (_validateSelection()) {
        setState(() {
          _isLoading = true;
        });
        try {
          await ref.set({
            "name": _nameController.text.toString(),
            "phoneNumber": "${selectedCountry.countryCode}${_phoneController.text.toString()}",
            "city": _cityController.text.toString(),
            "RoomOrHotel": selectedOption.toString(),
            "Date": "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            "Time": formattedTime.toString(),
          });

          setState(() {
            _isLoading = false;
            _nameController.clear();
            _phoneController.clear();
            _cityController.clear();
            selectedOption = '';
            selectedCountry = Country(
              phoneCode: "92",
              countryCode: "PK",
              e164Sc: 0,
              geographic: true,
              level: 1,
              name: "Pakistan",
              example: "Pakistan",
              displayName: "Pakistan",
              displayNameNoCountryCode: "PK",
              e164Key: "",
            );
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Request submitted successfully')),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Request submitted successfully')),
          );
        } catch (error) {
          print('Failed to submit request: $error');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit request: $error')),
          );
        }


        setState(() {
          _isLoading=false;
        });
      }

    }

  }
  int generateUniqueValue() {
    final DateTime now = DateTime.now();
    final int timestamp = now.millisecondsSinceEpoch;
    return -timestamp; // Negate the timestamp to ensure decreasing order
  }
  bool _validateSelection() {
    if (selectedOption.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select Between Hotel and Home.'),
        ),
      );
      return false;
    }
    return true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Partner with DIDI',
          style: TextStyle(color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Become a DIDI partner',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLength: 30,
                          controller: _nameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else if (!RegExp(r'^[a-zA-Z\s]+$')
                                .hasMatch(value)) {
                              return 'Only alphabets are allowed';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              _phoneController.text = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            hintText: "Enter phone number",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 1.5,
                              ),
                            ),
                            prefixIcon: Container(
                              width: 90,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      countryListTheme:
                                          const CountryListThemeData(
                                        bottomSheetHeight: 500,
                                      ),
                                      context: context,
                                      onSelect: (value) {
                                        setState(() {
                                          selectedCountry = value;
                                        });
                                      },
                                    );
                                  },
                                  child: Text(
                                    "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            suffixIcon: _phoneController.text.length > 9
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  )
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                            ),
                            errorMaxLines: 1,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Phone number can only contain digits';
                            }
                            if (value.length < 10) {
                              return 'Phone number must be at least 10 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            labelText: 'City',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOption = 'Home';
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: selectedOption == 'Home'
                                            ? Colors.green[100]
                                            : Colors.white,
                                        border: Border.all(
                                          color: selectedOption == 'Home'
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.home,
                                            size: 50,
                                            color: selectedOption == 'Home'
                                                ? Colors.green
                                                : Colors.black,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Home",
                                            style: TextStyle(
                                              color: selectedOption == 'Home'
                                                  ? Colors.green
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (selectedOption == 'Home')
                                      Positioned(
                                        top: 1,
                                        left: 1,
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOption = 'Hotel';
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: selectedOption == 'Hotel'
                                            ? Colors.green[100]
                                            : Colors.white,
                                        border: Border.all(
                                          color: selectedOption == 'Hotel'
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.hotel,
                                            size: 50,
                                            color: selectedOption == 'Hotel'
                                                ? Colors.green
                                                : Colors.black,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Hotel",
                                            style: TextStyle(
                                              color: selectedOption == 'Hotel'
                                                  ? Colors.green
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (selectedOption == 'Hotel')
                                      Positioned(
                                        top: 1,
                                        left: 1,
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    _submitForm();
                                  },
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "REQUEST A CALL",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
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
        ],
      ),
    );
  }
}
