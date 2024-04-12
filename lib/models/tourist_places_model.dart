// ignore_for_file: public_member_api_docs, sort_constructors_first
class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Translator", image: "assets/icons/Translator.png"),
  TouristPlacesModel(name: "Taxi", image: "assets/icons/Taxi.png"),
  TouristPlacesModel(name: "Accommodations", image: "assets/icons/Accomadations.png"),
  TouristPlacesModel(name: "Maps", image: "assets/icons/Maps.jpeg"),
  TouristPlacesModel(name: "Foods", image: "assets/icons/Foods.png"),
];
