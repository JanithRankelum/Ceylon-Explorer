import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';

class Distance extends StatelessWidget {
  final double userLatitude = 0.0; // Replace with user's latitude
  final double userLongitude = 0.0; // Replace with user's longitude
  final double placeLatitude = 0.0; // Replace with place's latitude
  final double placeLongitude = 0.0; // Replace with place's longitude

  const Distance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _calculateDistance(),
      builder: (context, AsyncSnapshot<double> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while calculating distance
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        double distanceInMeters = snapshot.data!;
        return Row(
          children: [
            const Icon(
              Ionicons.locate_outline,
              color: Colors.black54,
              size: 14,
            ),
            const Text(
              "Distance",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 3),
            ...List.generate(
              18,
              (index) {
                return Expanded(
                  child: Container(
                    height: 2,
                    color: index.isOdd ? Colors.transparent : Colors.black54,
                  ),
                );
              },
            ),
            const SizedBox(width: 3),
            Icon(
              Ionicons.location_outline,
              size: 14,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 2),
            Text(
              "${(distanceInMeters / 1000).toStringAsFixed(2)} km", // Convert distance from meters to kilometers
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        );
      },
    );
  }

  Future<double> _calculateDistance() async {
    return await Geolocator.distanceBetween(
      userLatitude,
      userLongitude,
      placeLatitude,
      placeLongitude,
    );
  }
}
