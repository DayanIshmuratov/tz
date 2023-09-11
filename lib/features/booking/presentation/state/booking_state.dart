part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class BookingInitial extends BookingState {
  @override
  List<Object> get props => [];
}

class BookingLoading extends BookingState {
  @override
  List<Object> get props => [];
}

class BookingLoaded extends BookingState {
  final BookingEntity booking;

  const BookingLoaded({required this.booking});

  @override
  List<Object> get props => [
    booking
  ];
}

class BookingError extends BookingState {
  final String message;

  const BookingError({required this.message});
  @override
  List<Object> get props => [message];
}
