import 'package:tz/features/room/data/datasources/room_api_service.dart';

import '../models/room_model.dart';

abstract class RoomRemoteDataSource {
  Future<RoomsModel> getRooms();
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final RoomApiService roomApiService;

  RoomRemoteDataSourceImpl({required this.roomApiService});
  @override
  Future<RoomsModel> getRooms() {
    return roomApiService.getRooms();
  }
}