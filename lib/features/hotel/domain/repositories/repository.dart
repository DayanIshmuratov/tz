import '../entities/hotel_entity.dart';

abstract class HotelRepository {
  Future<HotelEntity> getHotel();
}