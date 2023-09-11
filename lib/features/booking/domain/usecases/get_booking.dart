
import 'package:tz/features/booking/domain/repository/booking_repository.dart';

import '../entities/booking_entity.dart';

class GetBooking {
  final BookingRepository bookingRepository;

  GetBooking({required this.bookingRepository});

  Future<BookingEntity> call() async {
    return await bookingRepository.getBooking();
  }

}