import 'package:tz/features/room/data/datasources/room_api_service.dart';

import '../models/room_model.dart';

abstract class RoomRemoteDataSource {
  Future<List<RoomModel>> getRooms();
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final RoomApiService apiService;

  RoomRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<RoomModel>> getRooms() {
  }
}