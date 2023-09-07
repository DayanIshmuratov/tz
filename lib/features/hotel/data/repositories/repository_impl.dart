import 'package:tz/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';
import 'package:tz/features/hotel/domain/repositories/repository.dart';

import '../../../../core/error/exceptions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource hotelRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;
  HotelRepositoryImpl({required this.hotelRemoteDataSource, required this.internetConnectionChecker});

  @override
  Future<HotelEntity> getHotel() async {
    if (await internetConnectionChecker.hasConnection) {
      try {
      return await hotelRemoteDataSource.getHotel();
    }  catch (e) {
      throw ServerException(message: 'Ошибка получения данных отеля');
    }
    } else {
      throw NetworkException(message: 'Ошибка соединения');
    }
  }
}