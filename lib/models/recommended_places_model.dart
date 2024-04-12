// ignore_for_file: public_member_api_docs, sort_constructors_first

class RecommendedPlaceModel {
  final String name;
  final String image;
  final double rating;
  final String location;

  RecommendedPlaceModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    name: "Ruwanweliseya",
    image: "assets/places/Provinces/NorthCentral/Anuradhapura/ruwanweliseya-anuradhapura.jpg",
    rating: 4.4,
    location: "Anuradhapura, Sri Lanka",
  ),
  RecommendedPlaceModel(
    name: "Sigiriya",
    image: "assets/places/Provinces/Central/Mathale/Sigiriya.jpg",
    rating: 4.8,
    location: "Dambulla, Sri Lanka",
  ),
  RecommendedPlaceModel(
    name: "Sinharaja Forest",
    image: "assets/places/Provinces/Sabaragamuwa/Rathanapura/Sinharaja.jpg",
    rating: 4.6,
    location: "Sabaragamuwa, southern",
  ),
  RecommendedPlaceModel(
    name: "Unawatuna Beach",
    image: "assets/places/Provinces/Southern/Galle/Unawatuna.jpg",
    rating: 4.7,
    location: "Galle, Sri Lanka",
  ),
  RecommendedPlaceModel(
    name: "Adam's Peak",
    image: "assets/places/Provinces/Central/Nuwara Eliya/Adam's peak.jpg",
    rating: 4.5,
    location: "Nallathanniya, Sri Lanka",
  ),
];
