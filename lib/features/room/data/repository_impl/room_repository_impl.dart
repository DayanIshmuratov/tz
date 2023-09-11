import 'dart:developer';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tz/features/room/domain/entities/room_entity.dart';
import 'package:tz/features/room/domain/repository/room_repository.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/room_remote_data_source.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource roomRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;
  RoomRepositoryImpl({required this.roomRemoteDataSource, required this.internetConnectionChecker});

  @override
  Future<RoomsEntity> getRooms() async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        return await roomRemoteDataSource.getRooms();
      }  catch (e, s) {
        log(e.toString(), stackTrace: s);
        throw ServerException(message: 'Ошибка получения данных комнат');
      }
    } else {
      throw NetworkException(message: 'Ошибка соединения');
    }
  }
}