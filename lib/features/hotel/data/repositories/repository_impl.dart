import 'package:tz/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';
import 'package:tz/features/hotel/domain/repositories/repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource hotelRemoteDataSource;

  HotelRepositoryImpl({required this.hotelRemoteDataSource});

  @override
  Future<HotelEntity> getData() async {
   return await hotelRemoteDataSource.getHotel();
  }
}