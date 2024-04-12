import 'package:flutter/material.dart';
import 'package:ceylon_explorer/models/tourist_places_model.dart';
import 'package:ceylon_explorer/pages/translator_page.dart';
import 'package:ceylon_explorer/pages/taxi_page.dart';
import 'package:ceylon_explorer/pages/accommodations_page.dart';
import 'package:ceylon_explorer/pages/maps_page.dart';
import 'package:ceylon_explorer/pages/foods_page.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: touristPlaces.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToPage(context, touristPlaces[index].name),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: Text(touristPlaces[index].name),
                avatar: CircleAvatar(
                  backgroundImage: AssetImage(touristPlaces[index].image),
                ),
                backgroundColor: Colors.white,
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToPage(BuildContext context, String name) {
  switch (name) {
    case "Translator":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TranslatorPage()),
      );
      break;
    case "Taxi":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaxiPage()),
      );
      break;
    case "Accommodations": // Corrected typo here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccommodationsPage()),
      );
      break;
    case "Maps":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapsPage()),
      );
      break;
    case "Foods":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodsPage()),
      );
      break;
  }
  }
}