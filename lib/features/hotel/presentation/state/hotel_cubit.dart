import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';

import '../../domain/usecases/get_hotel.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final GetHotel getHotel;
  HotelCubit({required this.getHotel}) : super(HotelInitial());

  Future<void> getData() async {
    emit(HotelLoading());
    try {
      final result = await getHotel();
      emit(HotelLoaded(hotel: result));
    } catch (e, s){
      log(e.toString(), stackTrace: s);
      emit(HotelError(message: e.toString()));
    }
  }
}
