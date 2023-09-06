import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/hotel_model.dart';
part 'hotel_api_service.g.dart';
@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class HotelApiService {
  factory HotelApiService(Dio dio) = _HotelApiService;
  @GET('35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelModel> getHotel();
}