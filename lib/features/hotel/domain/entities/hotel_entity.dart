import 'package:json_annotation/json_annotation.dart';

class HotelEntity {
  final int id;
  final String name;
  final String address;
  @JsonKey(name: 'minimal_price')
  final int minimalPrice;

  @JsonKey(name: 'price_for_it')
  final String priceForIt;

  final int rating;
  @JsonKey(name: 'rating_name')
  final String ratingName;

  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  @JsonKey(name: 'about_the_hotel')
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
  final List<String> peculiarities;

  const AboutTheHotelEntity({
    required this.description,
    required this.peculiarities,
  });
}
