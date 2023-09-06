import 'package:json_annotation/json_annotation.dart';

class HotelEntity {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<dynamic> imageUrls;
  final AboutTheHotelEntity aboutTheHotel;

  const HotelEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

}

class AboutTheHotelEntity {
  final String description;
  final List<dynamic> peculiarities;

  const AboutTheHotelEntity({
    required this.description,
    required this.peculiarities,
  });
}
