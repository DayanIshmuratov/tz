import 'package:equatable/equatable.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends BookingEntity with EquatableMixin {
  BookingModel({
      required super.id,
      required super.hotelName,
      required super.hotelAddress,
      required super.horating,
      required super.ratingName,
      required super.departure,
      required super.tourDateStart,
      required super.tourDateStop,
      required super.numberOfNights,
      required super.room,
      required super.nutrition,
      required super.tourPrice,
      required super.fuelCharge,
      required super.serviceCharge,
      required super.arrivalCountry});

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}
