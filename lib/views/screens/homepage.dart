import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:poppyflow/constants/kConstants.dart';
import 'package:poppyflow/views/screens/theflowpage.dart';

import 'favourites.dart';
import 'poses.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    const YogaPosesPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pflowBlueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: kIsWeb ? false : true,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        title: _currentIndex == 0
            ? const Text(
                'Home',
              )
            : _currentIndex == 1
                ? const Text('Yoga Poses')
                : _currentIndex == 2
                    ? const Text('Favorites')
                    : const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: pflowBlueGrey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheFlowPage(),
            ),
          );
        },
        child: FractionallySizedBox(
          widthFactor:
              3.3, // Set the fraction of the available width (0.5 for 50%)
          heightFactor:
              3.5, // Set the fraction of the available height (0.5 for 50%)
          child: kPwPLogo, // Replace with your logo widget (kPwPLogo)
        ),
      ),
      bottomNavigationBar: AnimatedBottomAppBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomAppBarItem(
            icon: Icons.home,
            label: 'Home',
          ),
          BottomAppBarItem(
            icon: Icons.accessibility_new_sharp,
            label: 'Poses',
          ),
          BottomAppBarItem(
            icon: Icons.favorite,
            label: 'Favourite',
          ),
          BottomAppBarItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomePageContent extends StatelessWidget {
  // Sample data for each section (What's New, Popular Poses, Mindfulness)
  final List<String> whatsNewItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];

  final List<String> popularPosesItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];

  final List<String> mindfulnessItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          3, // Number of sections (What's New, Popular Poses, Mindfulness)
      itemBuilder: (context, sectionIndex) {
        List<String> items;
        String sectionTitle;
        switch (sectionIndex) {
          case 0:
            items = whatsNewItems;
            sectionTitle = 'What\'s New';
            break;
          case 1:
            items = popularPosesItems;
            sectionTitle = 'Popular Poses';
            break;
          case 2:
            items = mindfulnessItems;
            sectionTitle = 'Mindfulness';
            break;
          default:
            items = [];
            sectionTitle = '';
            break;
        }
        return SectionCard(title: sectionTitle, items: items);
      },
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final List<String> items;

  SectionCard({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: CardItem(
                        title: items[index],
                      ),
                    ),
                  ),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomAppBarItem> items;

  AnimatedBottomAppBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: BottomAppBar(
        color: pflowBlueGrey,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkResponse(
                  onTap: () => onTap(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        items[0].icon,
                        color: currentIndex == 0 ? pflowBlue : Colors.white,
                      ),
                      Text(
                        items[0].label,
                        style: TextStyle(
                          color: currentIndex == 0 ? pflowBlue : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkResponse(
                  onTap: () => onTap(1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        items[1].icon,
                        color: currentIndex == 1 ? pflowBlue : Colors.white,
                      ),
                      Text(
                        items[1].label,
                        style: TextStyle(
                          color: currentIndex == 1 ? pflowBlue : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48), // Spacing for the FAB
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkResponse(
                  onTap: () => onTap(2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        items[2].icon,
                        color: currentIndex == 2 ? pflowBlue : Colors.white,
                      ),
                      Text(
                        items[2].label,
                        style: TextStyle(
                          color: currentIndex == 2 ? pflowBlue : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: InkResponse(
                  onTap: () => onTap(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        items[3].icon,
                        color: currentIndex == 3 ? pflowBlue : Colors.white,
                      ),
                      Text(
                        items[3].label,
                        style: TextStyle(
                          color: currentIndex == 3 ? pflowBlue : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;

  CardItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 2,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class BottomAppBarItem {
  final IconData icon;
  final String label;

  BottomAppBarItem({required this.icon, required this.label});
}
