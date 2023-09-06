import 'dart:convert';

import 'package:tz/features/hotel/data/models/hotel_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import 'hotel_api_service.dart';

abstract class HotelRemoteDataSource {
  Future<HotelModel> getHotel();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  final http.Client client;
  final HotelApiService hotelApiService;
  HotelRemoteDataSourceImpl({required this.client, required this.hotelApiService});

  @override
  Future<HotelModel> getHotel() async {
    return await hotelApiService.getHotel();
    // final response = await client.get(Uri.parse('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
    //     , headers: {'Content-Type': 'application/json'});
    // if (response.statusCode == 200) {
    //   return HotelModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw ServerException();
    // }
  }
}