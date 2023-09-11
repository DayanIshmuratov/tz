import 'package:tz/features/booking/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<BookingEntity> getBooking();
}