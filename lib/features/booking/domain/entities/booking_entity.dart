import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BookingEntity extends Equatable {
  final int id;
  @JsonKey(name: 'hotel_name')
  final String hotelName;
  @JsonKey(name: 'hotel_adress')
  final String hotelAddress;
  final int horating;
  @JsonKey(name: 'rating_name')
  final String ratingName;
  final String departure;
  @JsonKey(name: 'arrival_country')
  final String arrivalCountry;
  @JsonKey(name: 'tour_date_start')
  final String tourDateStart;
  @JsonKey(name: 'tour_date_stop')
  final String tourDateStop;
  @JsonKey(name: 'number_of_nights')
  final int numberOfNights;
  final String room;
  final String nutrition;
  @JsonKey(name: 'tour_price')
  final int tourPrice;
  @JsonKey(name: 'fuel_charge')
  final int fuelCharge;
  @JsonKey(name: 'service_charge')
  final int serviceCharge;

  BookingEntity({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
    required this.arrivalCountry,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        hotelName,
        hotelAddress,
        horating,
        ratingName,
        departure,
        tourDateStart,
        tourDateStop,
        numberOfNights,
        room,
        nutrition,
        tourPrice,
        fuelCharge,
        serviceCharge,
        arrivalCountry,
      ];
}
