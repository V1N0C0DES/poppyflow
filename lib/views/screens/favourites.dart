import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Placeholder data for favorites (replace this with your actual data)
  final List<String> favoritesList = [
    'Favorite 1',
    'Favorite 2',
    'Favorite 3',
    // Add more favorites as needed
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Simulating loading data from an async source (e.g., API call)
      future: Future.delayed(Duration(seconds: 2), () => favoritesList),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data, show the shimmer effect
          return _buildShimmerGrid();
        } else if (snapshot.hasError) {
          // Handle error state
          return Center(
            child: Text('Error loading favorites'),
          );
        } else {
          // Data loaded, show the actual grid view
          final List<String> favoritesList = snapshot.data as List<String>;
          return _buildFavoritesGrid(favoritesList);
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

  Widget _buildFavoritesGrid(List<String> favoritesList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          final favorite = favoritesList[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(favorite),
            ),
          );
        },
      ),
    );
  }
}
