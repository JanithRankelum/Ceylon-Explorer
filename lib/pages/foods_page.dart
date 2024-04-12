import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Model class for food delivery services
class FoodService {
  final String name;
  final String imageUrl;
  final String url;

  FoodService({
    required this.name,
    required this.imageUrl,
    required this.url,
  });
}

// List of food delivery services
final List<FoodService> foodServices = [
  FoodService(
    name: "Uber Eats",
    imageUrl: "assets/icons/Foods/Uber Eats.png",
    url: "https://www.ubereats.com/lk",
  ),
  FoodService(
    name: "PickMe Food",
    imageUrl: "assets/icons/Foods/Pickmefood.jpeg",
    url: "https://pickme.lk/food",
  ),
  FoodService(
    name: "Eat.lk",
    imageUrl: "assets/icons/Foods/Eat.png",
    url: "https://eat.lk/",
  ),
  FoodService(
    name: "YAMU",
    imageUrl: "assets/icons/Foods/Yamu.png",
    url: "https://www.yamu.lk/delivery",
  ),
  FoodService(
    name: "Doorstep.lk",
    imageUrl: "assets/icons/Foods/Door step.jpeg",
    url: "https://www.doorstep.lk/",
  ),
];

class FoodsPage extends StatelessWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery Services in Sri Lanka'),
      ),
      body: ListView.builder(
        itemCount: foodServices.length,
        itemBuilder: (context, index) {
          final service = foodServices[index];
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
