import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class YogaPosesPage extends StatefulWidget {
  const YogaPosesPage({super.key});

  @override
  State<YogaPosesPage> createState() => _YogaPosesPageState();
}

class _YogaPosesPageState extends State<YogaPosesPage> {
  // Placeholder data for yoga poses (replace this with your actual data)
  final List<String> yogaPosesList = [
    'Pose 1',
    'Pose 2',
    'Pose 3',

    // Add more poses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Simulating loading data from an async source (e.g., API call)
      future: Future.delayed(Duration(seconds: 2), () => yogaPosesList),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data, show the shimmer effect
          return _buildShimmerGrid();
        } else if (snapshot.hasError) {
          // Handle error state
          return Center(
            child: Text('Error loading yoga poses'),
          );
        } else {
          // Data loaded, show the actual grid view
          final List<String> yogaPosesList = snapshot.data as List<String>;
          return _buildYogaPosesGrid(yogaPosesList);
        }
      },
    );
  }

  Widget _buildShimmerGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 6, // Number of shimmering grid items
          itemBuilder: (context, index) {
            return Container(
              color: Colors
                  .white, // This color doesn't matter, just for the shimmer effect
            );
          },
        ),
      ),
    );
  }

  Widget _buildYogaPosesGrid(List<String> yogaPosesList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: yogaPosesList.length,
        itemBuilder: (context, index) {
          final pose = yogaPosesList[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(pose),
            ),
          );
        },
      ),
    );
  }
}
