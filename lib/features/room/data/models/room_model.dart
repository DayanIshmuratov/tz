import 'package:equatable/equatable.dart';
import 'package:tz/features/room/domain/entities/room_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room_model.g.dart';

@JsonSerializable()
class RoomsModel extends RoomsEntity with EquatableMixin {
  RoomsModel({required rooms}) : super(rooms: rooms);

  factory RoomsModel.fromJson(Map<String, dynamic> json) => _$RoomsModelFromJson(json);
}

@JsonSerializable()
class RoomModel extends RoomEntity with EquatableMixin {
  RoomModel({
    required id,
    required name,
    required price,
    required pricePer,
    required peculiarities,
    required imageUrls,
}) : super(id: id, name: name, price: price, pricePer: pricePer, peculiarities: peculiarities, imageUrls: imageUrls);

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

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