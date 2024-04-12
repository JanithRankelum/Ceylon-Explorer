class NearbyPlaceModel {
  final String name;
  final String image;
  final double rating;
  final String location;

  NearbyPlaceModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    name: "Galle Fort",
    image: "assets/places/Provinces/Southern/Galle/galle-fort.jpg",
    rating: 4.5,
    location: "Galle, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Sacred Temple of\nTooth Relic ",
    image: "assets/places/Provinces/Central/Kandy/kandy-lake-and-the-temple.jpg",
    rating: 4.2,
    location: "Kandy, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Polonnaruwa Vatadage",
    image: "assets/places/Provinces/NorthCentral/Polonnaruwa/Polonnaruwa Vatadage.jpg",
    rating: 4.7,
    location: "Polonnaruwa, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Udawalawe National Park",
    image: "assets/places/Provinces/Sabaragamuwa/Rathanapura/Udawalawa.jpg",
    rating: 4.3,
    location: "Udawalawa, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Madu River",
    image: "assets/places/Provinces/Southern/Galle/madu river.jpg",
    rating: 4.6,
    location: "Balapitiya, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Ambuluwawa",
    image: "assets/places/Provinces/Central/Kandy/ambuluwawa-tower.jpg",
    rating: 4.8,
    location: "Kandy, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Katharagama Temple",
    image: "assets/places/Provinces/Southern/Hambanthota/kataragama-temple.jpg",
    rating: 4.4,
    location: "katharagama, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Koneshwaram\nHindu Temple",
    image: "assets/places/Provinces/Eastern/Trincomalee/Koneshwaram Temple.jpg",
    rating: 4.2,
    location: "Trincomalee, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Nagadeepa Temple",
    image: "assets/places/Provinces/Northern/Jaffna/nagadeepa-rajamaha-viharaya.jpg",
    rating: 4.6,
    location: "Jaffna, Sri Lanka",
  ),
  NearbyPlaceModel(
    name: "Mirissa Diving",
    image: "assets/places/Provinces/Southern/Mathara/Mirissa Diving.jpg",
    rating: 4.5,
    location: "Mathara, Sri Lanka",
  ),
];
