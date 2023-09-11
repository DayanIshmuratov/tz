import 'package:tz/features/room/domain/entities/room_entity.dart';
import 'package:tz/features/room/domain/repository/room_repository.dart';

class GetRooms {
  final RoomRepository roomRepository;

  GetRooms({required this.roomRepository});

  Future<RoomsEntity> call() async {
    return await roomRepository.getRooms();
  }

}