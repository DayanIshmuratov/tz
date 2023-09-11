import 'dart:convert';

import 'package:tz/features/hotel/data/models/hotel_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import 'hotel_api_service.dart';

abstract class HotelRemoteDataSource {
  Future<HotelModel> getHotel();
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {

  final HotelApiService hotelApiService;
  HotelRemoteDataSourceImpl({required this.hotelApiService});

  @override
  Future<HotelModel> getHotel() async {
      return await hotelApiService.getHotel();
  }
}