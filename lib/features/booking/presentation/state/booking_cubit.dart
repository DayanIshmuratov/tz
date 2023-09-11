import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';

import '../../domain/usecases/get_booking.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetBooking getBooking;

  BookingCubit({required this.getBooking}) : super(BookingInitial());

  Future<void> getData() async {
    emit(BookingLoading());
    try {
      final result = await getBooking();
      emit(BookingLoaded(booking: result));
    } catch(e) {
      emit(BookingError(message: e.toString()));
    }
  }
}
