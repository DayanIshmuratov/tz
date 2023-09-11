import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RoomsEntity extends Equatable {
  final List<RoomEntity> rooms;

  const RoomsEntity({required this.rooms});

  @override
  List<Object?> get props => [rooms];
}
@JsonSerializable()
class RoomEntity extends Equatable {

  final int id;
  final String name;
  final int price;
  @JsonKey(name: 'price_per')
  final String pricePer;
  final List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  const RoomEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        pricePer,
        peculiarities,
        imageUrls,
      ];
}