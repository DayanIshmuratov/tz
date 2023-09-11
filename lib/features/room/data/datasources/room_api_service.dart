import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/room_model.dart';

part 'room_api_service.g.dart';
@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RoomApiService {
  factory RoomApiService(Dio dio) = _RoomApiService;
  @GET('f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<RoomsModel> getRooms();
}
