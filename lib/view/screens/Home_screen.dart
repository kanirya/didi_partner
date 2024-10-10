import 'package:didipartner/utils/constant/contants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for Bottom Navigation Bar
  final List<Widget> _screens = [
    Home(),        // Home screen
    FavoritesScreen(), // Favorites screen
    OrdersScreen(),    // Orders screen
    ProfileScreen(),   // Profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryGreen, // Your primary green color
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home), // Home icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.clipboardList), // Favorites icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase), // Orders icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user), // Profile icon
            label: '',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  bool _isScrolledDown = false;

  Future<void> _refreshData() async {
    // Simulate a network call or data refresh
    await Future.delayed(const Duration(seconds: 2));
    // Add your data loading logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( 70.0), // Change height based on scroll
        child: AppBar(
          title: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi, Danish',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
              AssetImage('assets/images/profile.jpg'), // Update with your image path
            ),
            const SizedBox(width: 9),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          setState(() {
            _isScrolledDown = scrollInfo.metrics.pixels > 50; // Check scroll position
          });
          return true;
        },
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshData,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Main content of the Home screen
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text('My Level', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Success Score', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Response Rate', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Rooms Available', style: TextStyle(fontSize: 16)), // Updated text
                    SizedBox(height: 10),
                    Text('Unique Link', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Earnings', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Spacing
              // Add more content if needed
            ],
          ),
        ),
      ),
    );
  }
}


class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
