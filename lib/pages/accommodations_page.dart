import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Model class for accommodation services
class AccommodationService {
  final String name;
  final String imageUrl;
  final String url;

  AccommodationService({
    required this.name,
    required this.imageUrl,
    required this.url,
  });
}

// List of accommodation services
final List<AccommodationService> accommodationServices = [
  AccommodationService(
    name: "Booking.com",
    imageUrl: "assets/icons/Accomodation/Booking.png",
    url: "https://www.booking.com",
  ),
  AccommodationService(
    name: "Agoda",
    imageUrl: "assets/icons/Accomodation/agoda.png",
    url: "https://www.agoda.com",
  ),
  AccommodationService(
    name: "Airbnb",
    imageUrl: "assets/icons/Accomodation/Airbnb.png",
    url: "https://www.airbnb.com",
  ),
  AccommodationService(
    name: "Expedia",
    imageUrl: "assets/icons/Accomodation/Expedia.png",
    url: "https://www.expedia.com",
  ),
  AccommodationService(
    name: "Hotels.com",
    imageUrl: "assets/icons/Accomodation/Hotels.png",
    url: "https://www.hotels.com",
  ),
  AccommodationService(
    name: "Tripadvisor",
    imageUrl: "assets/icons/Accomodation/Tripadvisor.png",
    url: "https://www.tripadvisor.com",
  ),
  AccommodationService(
    name: "MakeMyTrip",
    imageUrl: "assets/icons/Accomodation/Makemytrip.png",
    url: "https://www.makemytrip.com",
  ),
  AccommodationService(
    name: "Trivago",
    imageUrl: "assets/icons/Accomodation/Trivago.jpeg",
    url: "https://www.trivago.com",
  ),
];

class AccommodationsPage extends StatelessWidget {
  const AccommodationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accommodations in Sri Lanka'),
      ),
      body: ListView.builder(
        itemCount: accommodationServices.length,
        itemBuilder: (context, index) {
          final service = accommodationServices[index];
          return ListTile(
            leading: Image.asset(service.imageUrl),
            title: Text(service.name),
            trailing: ElevatedButton(
              onPressed: () {
                // Open URL in web browser
                launchURL(service.url);
              },
              child: const Text('Visit'),
            ),
          );
        },
      ),
    );
  }

  // Function to launch URL
  void launchURL(String url) async {
    // Launch URL in web browser
    await launch(url);
  }
}

