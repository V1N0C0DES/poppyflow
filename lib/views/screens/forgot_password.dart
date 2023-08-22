import 'package:flutter/material.dart';
import 'package:poppyflow/constants/kConstants.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pflowBlueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar background
        elevation: 0, // No shadow
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kSizedBoxH30,
            kPassWordLogo,
            kSizedBoxH20,
            const Text(
              'Forgot your password?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            kSizedBoxH10,
            const Text(
              'No worries! Enter your email and we will send you a link to reset your password.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            kSizedBoxH10,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // White background color
                  borderRadius: BorderRadius.circular(6), // Curved border
                ),
                child: const TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: InputBorder.none, // Remove default border
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ), // Adjust padding
                  ),
                ),
              ),
            ),
            kSizedBoxH20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(290, 40),
                backgroundColor: pflowBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {
                // Forgot password button logic
              },
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            // Back to login with icon text button
            kSizedBoxH20,
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                // Back to login button logic
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text(
                'Back to Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
