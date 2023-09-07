// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) =>
    HotelModel(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: json['image_urls'],
      aboutTheHotel: _$AboutTheHotelModelFromJson(json['about_the_hotel']),
    );


AboutTheHotelModel _$AboutTheHotelModelFromJson(
    Map<String, dynamic> json) =>
    AboutTheHotelModel(
      description: json['description'],
      peculiarities: json['peculiarities'],
    );