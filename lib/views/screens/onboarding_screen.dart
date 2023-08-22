import 'package:flutter/material.dart';
import 'package:poppyflow/constants/kConstants.dart';
import 'package:poppyflow/views/screens/sign_in_sign_up.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<Widget> pages = [
    OnboardingScreenPage(
      title: 'Welcome to Poppy Flow',
      description: 'Discover inner peace through yoga.',
      image: Image.asset('assets/images/signin.png'),
    ),
    OnboardingScreenPage(
      title: 'Find Your Balance',
      description: 'Explore various yoga poses.',
      image: Image.asset('assets/images/reg.png'),
    ),
    OnboardingScreenPage(
      title: 'Join Our Community',
      description: 'Connect with like-minded individuals.',
      image: Image.asset('assets/images/signin.png'),
    ),
    // Add more OnboardingScreenPage widgets for additional screens
  ];

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
      });
    });
  }

  void _onNextButtonPressed() {
    if (_currentPageIndex < pages.length - 1) {
      // Go to the next onboarding screen
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Sign In/Sign Up page
      // Replace this with your desired destination page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInSignUpPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pflowBlue.withOpacity(0.7),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          buildDotsIndicator(),
          kSizedBoxH20,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pflowBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 12.0,
              ),
            ),
            onPressed: _onNextButtonPressed,
            child: Text(_currentPageIndex == pages.length - 1 ? 'Next' : 'Skip',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                )),
          ),
          kSizedBoxH20,
        ],
      ),
    );
  }

  Widget buildDotsIndicator() {
    final dots = List<Widget>.generate(
      pages.length,
      (index) => buildDot(index),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  Widget buildDot(int index) {
    final isActive = index == _currentPageIndex;
    final dotSize = isActive ? 12.0 : 8.0;

    return Container(
      width: dotSize,
      height: dotSize * 3,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? pflowBlue : pflowBlueGrey,
      ),
    );
  }
}

class OnboardingScreenPage extends StatelessWidget {
  final String title;
  final String description;
  final Image image;

  const OnboardingScreenPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isPortrait ? 16.0 : 32.0,
        vertical: 18.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: isPortrait ? 100 : 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          kSizedBoxH20,
          Text(description,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300)),
          kSizedBoxH10,
          Expanded(child: Center(child: image)),
        ],
      ),
    );
  }
}
