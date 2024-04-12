import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
   MapsPage({Key? key}) : super(key: key);

  // List of offline map images
  final List<String> offlineMaps = [
    'assets/icons/Maps/map1_page-0001.jpg',
    'assets/icons/Maps/map2_page-0001.jpg',
    'assets/icons/Maps/map3_page-0001.jpg',
    'assets/icons/Maps/map4_page-0001.jpg',
    'assets/icons/Maps/map5_page-0001.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offlineMaps.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                offlineMaps[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}