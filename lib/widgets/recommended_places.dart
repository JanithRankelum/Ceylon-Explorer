import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ceylon_explorer/pages/tourist_details_page.dart';

// Model class for a recommended place
class RecommendedPlace {
  final String name;
  final double rating;
  final String location;
  final String image;

  RecommendedPlace({
    required this.name,
    required this.rating,
    required this.location,
    required this.image,
  });
}

// List of recommended places with unique data
List<RecommendedPlace> recommendedPlaces = [
  RecommendedPlace(
    name: "Ruwanweliseya",
    rating: 4.4,
    location: "Aunradhapura, Sri Lanka",
    image: "assets/places/Provinces/NorthCentral/Anuradhapura/ruwanweliseya-anuradhapura.jpg",
  ),
  RecommendedPlace(
    name: "Sigiriya",
    rating: 4.8,
    location: "Dambulla, Sri Lanka",
    image: "assets/places/Provinces/Central/Mathale/Sigiriya.jpg",
  ),
  RecommendedPlace(
    name: "Sinharaja Forest",
    rating: 4.6,
    location: "Sabaragamuwa, southern",
    image: "assets/places/Provinces/Sabaragamuwa/Rathanapura/Sinharaja.jpg",
  ),
  RecommendedPlace(
    name: "Unawatuna Beach",
    rating: 4.7,
    location: "Galle, Sri Lanka",
    image: "assets/places/Provinces/Southern/Galle/Unawatuna.jpg",
  ),
  RecommendedPlace(
    name: "Adam's Peak",
    rating: 4.5,
    location: "Nallathanniya, Sri Lanka",
    image: "assets/places/Provinces/Central/Nuwara Eliya/Adam's peak.jpg",
  ),
];

// RecommendedPlaces widget to display recommended places
class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final place = recommendedPlaces[index]; // Get the recommended place at the current index
          return SizedBox(
            width: 220,
            child: Card(
              elevation: 0.4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TouristDetailsPage(
                        image: place.image,
                        name: place.name,
                        rating: place.rating,
                        location: place.location,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          place.image,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            place.name, // Display the name of the place
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 14,
                          ),
                          Text(
                            place.rating.toString(), // Display the rating of the place
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Ionicons.location,
                            color: Theme.of(context).primaryColor,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            place.location, // Display the location of the place
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 10),
        ),
        itemCount: recommendedPlaces.length,
      ),
    );
  }
}

// Main function to run the app
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: RecommendedPlaces(), // Display the RecommendedPlaces widget
      ),
    ),
  ));
}
