import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
            image: 'assets/onboarding1.png',
            title: 'Welcome to Doctor Appointment App',
            subtitle: 'Book appointments with ease',
          ),
          _buildPage(
            image: 'assets/onboarding2.png',
            title: 'Find Doctors',
            subtitle: 'Search for doctors by specialization',
          ),
          _buildPage(
            image: 'assets/onboarding3.png',
            title: 'Manage Your Appointments',
            subtitle: 'Keep track of all your appointments',
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    String image,
    String title,
    String subtitle,
    bool isLastPage = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 32.0),
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 32.0),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Get Started'),
            ),
        ],
      ),
    );
  }
}
