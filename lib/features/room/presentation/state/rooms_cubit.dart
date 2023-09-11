import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tz/features/room/domain/entities/room_entity.dart';

import '../../domain/usecases/get_rooms.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final GetRooms getRooms;
  RoomsCubit({required this.getRooms}) : super(RoomsInitial());

  Future<void> getData() async {
    emit(RoomsLoading());
    try {
      final result = await getRooms();
      emit(RoomsLoaded(rooms: result));
    } catch (e) {
      emit(RoomsError(message: e.toString()));
    }
  }
}
