import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/kConstants.dart';
import '../../widgets/socialmediabuttons.dart';
import 'forgot_password.dart';
import 'homepage.dart';

class SignInSignUpPage extends StatefulWidget {
  const SignInSignUpPage({Key? key}) : super(key: key);

  @override
  _SignInSignUpPageState createState() => _SignInSignUpPageState();
}

class _SignInSignUpPageState extends State<SignInSignUpPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late PageController _pageController;
  int _currentPageIndex = 0;

  final List<Widget> _authForms = [
    const SignInForm(),
    const SignUpForm(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void _handleAuthSelection(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        children: [
          const SizedBox(height: 40),
          _buildLogo(),
          const SizedBox(height: 10),
          _buildAuthSelection(),
          const SizedBox(height: 20),
          _buildSwipeIndicator(),
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: _authForms,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        width: 320,
        height: 120,
        child: kPoppyFlowLogo,
      ),
    );
  }

  Widget _buildSwipeIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          // Wrap the first Container with Expanded
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Container(
              height: 2,
              color: _currentPageIndex == 0 ? Colors.white : Colors.transparent,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          // Wrap the second Container with Expanded
          child: Container(
            height: 2,
            color: _currentPageIndex == 1 ? Colors.white : Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _handleAuthSelection(0),
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: _currentPageIndex == 0 ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 80),
        GestureDetector(
          onTap: () => _handleAuthSelection(1),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: _currentPageIndex == 1 ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// Sign up Form
class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                labelText: 'First Name',
                hintText: 'Enter your first name',
                // prefixIcon: Icon(Icons.email),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ), // Adjust padding// Adjust horizontal padding
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                labelText: 'Email',
                hintText: 'Enter your email',
                // prefixIcon: Icon(Icons.email),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ), // Adjust padding// Adjust horizontal padding
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                labelText: 'Password',
                hintText: 'Enter your password',
                // prefixIcon: Icon(Icons.lock),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10), // Adjust padding
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                // prefixIcon: Icon(Icons.lock),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10), // Adjust padding
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 45),
              backgroundColor: pflowBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Sign up button logic
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Alternatively, create an account by signing in with Facebook, Google, or LinkedIn
          const Text(
            'Alternatively, create an account by signing in with Facebook, Google, or LinkedIn',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Sign in Form
class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'Email or phone number',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                // prefixIcon: Icon(Icons.email),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ), // Adjust padding// Adjust horizontal padding
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(10), // Curved border
            ),
            child: TextField(
              style: const TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                labelText: 'Password',
                // prefixIcon: Icon(Icons.lock),
                border: InputBorder.none, // Remove default border
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10), // Adjust padding
              ),
            ),
          ),
          const SizedBox(height: 16),
          // forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
                // Forgot password button logic
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 45),
              backgroundColor: pflowBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Or',
            style: TextStyle(color: Colors.white),
          ),
          // line divider underneath
          const Divider(
            color: Colors.white,
            thickness: 1,
            indent: 150,
            endIndent: 150,
          ),
          Flexible(
            child: ListView(
              children: [
                CustomWidgets.socialButtonRect('Sign in with Facebook',
                    facebookColor, FontAwesomeIcons.facebookF, onTap: () {
                  Fluttertoast.showToast(msg: 'I am facebook');
                }),
                CustomWidgets.socialButtonRect(
                    'Sign in with Google', googleColor, FontAwesomeIcons.google,
                    onTap: () {
                  Fluttertoast.showToast(msg: 'I am google');
                }),
                CustomWidgets.socialButtonRect('Sign in with LinkedIn',
                    linkedinColor, FontAwesomeIcons.linkedinIn, onTap: () {
                  Fluttertoast.showToast(msg: 'I am linkedin');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
