import 'package:equatable/equatable.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel extends HotelEntity with EquatableMixin {
  const HotelModel({
    required id,
    required name,
    required address,
    required minimalPrice,
    required priceForIt,
    required rating,
    required ratingName,
    required imageUrls,
    required aboutTheHotel}) : super(
    id: id,
    name: name,
    address: address,
    minimalPrice: minimalPrice,
    priceForIt: priceForIt,
    rating: rating,
    ratingName: ratingName,
    imageUrls: imageUrls,
    aboutTheHotel: aboutTheHotel,
  );


  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    minimalPrice,
    priceForIt,
    rating,
    ratingName,
    imageUrls,
    aboutTheHotel
  ];
}



@JsonSerializable()
class AboutTheHotelModel extends AboutTheHotelEntity {
  AboutTheHotelModel({
    required description,
    required peculiarities,
  }) : super(
  description: description,
  peculiarities: peculiarities);

  factory AboutTheHotelModel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelModelFromJson(json);

}