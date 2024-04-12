
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCard extends StatelessWidget {
  final String location;

  const LocationCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/map.png',
              width: 100,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchMapsUrl(); // Function to launch Google Maps
                  },
                  child: Text(
                    "Location",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Function to launch Google Maps
  void _launchMapsUrl() async {
    const url = 'https://www.google.com/maps'; // URL for Google Maps
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: LocationCard(location: "Colombo, Sri Lanka"), // Display the LocationCard widget with initial location
      ),
    ),
  ));
}


