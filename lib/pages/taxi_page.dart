import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Model class for taxi services
class TaxiService {
  final String name;
  final String imageUrl;
  final String url;

  TaxiService({
    required this.name,
    required this.imageUrl,
    required this.url,
  });
}

// List of taxi services
final List<TaxiService> taxiServices = [
  TaxiService(
    name: "PickMe",
    imageUrl: "assets/icons/Taxi/Pickme.jpeg",
    url: "https://www.pickme.lk/",
  ),
  TaxiService(
    name: "Uber",
    imageUrl: "assets/icons/Taxi/Uber.png",
    url: "https://www.uber.com/lk/en/",
  ),
];

class TaxiPage extends StatelessWidget {
  const TaxiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taxi Services in Sri Lanka'),
      ),
      body: ListView.builder(
        itemCount: taxiServices.length,
        itemBuilder: (context, index) {
          final service = taxiServices[index];
          return ListTile(
            leading: Image.asset(service.imageUrl),
            title: Text(service.name),
            trailing: ElevatedButton(
              onPressed: () {
                // Open URL in web browser
                // You can also use other packages like url_launcher for this purpose
                // Note: This will only work on platforms that support opening URLs in web browsers
                // On other platforms, you may need to handle the URL differently
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
