import 'dart:developer';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';
import 'package:tz/features/booking/domain/repository/booking_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../data_sources/booking_remote_data_source.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;
  BookingRepositoryImpl({required this.bookingRemoteDataSource, required this.internetConnectionChecker});

  @override
  Future<BookingEntity> getBooking() async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        return await bookingRemoteDataSource.getBooking();
      }  catch (e, s) {
        log(e.toString(), stackTrace: s);
        throw ServerException(message: 'Ошибка получения данных бронирования');
      }
    } else {
      throw NetworkException(message: 'Ошибка соединения');
    }
  }
}