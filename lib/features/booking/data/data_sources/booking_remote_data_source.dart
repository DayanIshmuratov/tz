import '../models/booking_model.dart';
import 'booking_api_service.dart';

abstract class BookingRemoteDataSource  {
  Future<BookingModel> getBooking();
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final BookingApiService bookingApiService;

  BookingRemoteDataSourceImpl({required this.bookingApiService});

  @override
  Future<BookingModel> getBooking() async {
    return await bookingApiService.getBooking();
  }
}