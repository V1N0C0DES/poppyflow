import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:poppyflow/constants/kConstants.dart';

import 'breathworksessionpage.dart';

class TheFlowPage extends StatelessWidget {
  const TheFlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pflowMistyGrey,
      appBar: AppBar(
        title: Text('Meditation'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Breath Work and Meditation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: pflowBlueGrey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Breath work and meditation are powerful practices that can help you reduce stress, improve focus, and promote overall well-being. Take a few moments to relax, find a comfortable position, and follow the guided breath work session to feel more centered and grounded.',
              style: TextStyle(
                fontSize: 16,
                color: pflowBlueGrey,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BreathWorkSessionPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: pflowBlueGrey,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Start Breath Work Session',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: pflowBlue,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Benefits of Breath Work and Meditation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: pflowBlueGrey,
              ),
            ),
            SizedBox(height: 8),
            _buildBenefitsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsList() {
    // Sample data for benefits of breath work and meditation
    final List<String> benefits = [
      'Reduced stress and anxiety',
      'Improved focus and concentration',
      'Enhanced emotional well-being',
      'Better sleep quality',
      'Increased self-awareness',
      'Promoted relaxation and calmness',
      'Boosted immune system',
    ];

    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: benefits.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: _buildBenefitItem(benefits[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            color: pflowBlue,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              benefit,
              style: TextStyle(
                fontSize: 16,
                color: pflowBlueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
