import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/booking_model.dart';
part 'booking_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class BookingApiService {
  factory BookingApiService(Dio dio) = _BookingApiService;
  @GET('e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<BookingModel> getBooking();
}