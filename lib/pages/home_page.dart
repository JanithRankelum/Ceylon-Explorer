import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;
import 'package:ceylon_explorer/widgets/custom_icon_button.dart';
import 'package:ceylon_explorer/widgets/location_card.dart';
import 'package:ceylon_explorer/widgets/nearby_places.dart';
import 'package:ceylon_explorer/widgets/recommended_places.dart';
import 'package:ceylon_explorer/widgets/tourist_places.dart';

// Import the pages
import 'package:ceylon_explorer/pages/bookmark_page.dart';
import 'package:ceylon_explorer/pages/districts_page.dart';
import 'package:ceylon_explorer/pages/blogs_page.dart';
import 'package:ceylon_explorer/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _greeting;
  late String _weather = 'Loading...';
  late String _temperature = 'Loading...';

  @override
  void initState() {
    super.initState();
    _updateWeather();
    _updateGreeting();
  }

  void _updateGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 17) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else if (hour < 20) {
      setState(() {
        _greeting = 'Good Evening';
      });
    } else {
      setState(() {
        _greeting = 'Good Night';
      });
    }
  }

  Future<void> _updateWeather() async {
    final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=d599958eb7e7409dbda41308241204&q=Colombo'));



    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final condition = jsonData['current']['condition']['text'];
      final tempC = jsonData['current']['temp_c'];

      setState(() {
        _weather = condition;
        _temperature = '$tempC°C';
      });
    } else {
      setState(() {
        _weather = 'Failed to load weather';
        _temperature = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _greeting ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _weather ?? '',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              _temperature ?? '',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(Ionicons.search_outline),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(Ionicons.notifications_outline),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          // LOCATION CARD
          const LocationCard(location: "Colombo, Sri Lanka"),

          const SizedBox(
            height: 15,
          ),
          const TouristPlaces(),
          // CATEGORIES
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),
          const RecommendedPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby From You",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
          // Added code snippet goes here
          // Update the home page adding the provided code snippet
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.globe_outline),
            label: "Districts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.newspaper_outline),
            label: "Blogs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          )
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to Home page (current page)
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookmarkPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DistrictsPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlogsPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(name: 'Janith Rankelum', email: 'janithrankelum0602@gmail.com', imageUrl: 'assets/Profile1.png',)),
              );
              break;
          }
        },
      ),
    );
  }
}

