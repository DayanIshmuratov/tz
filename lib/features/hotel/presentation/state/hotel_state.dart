
part of 'hotel_cubit.dart';

abstract class HotelState extends Equatable {
  const HotelState();
}

class HotelInitial extends HotelState {
  @override
  List<Object> get props => [];
}

class HotelLoading extends HotelState {
  @override
  List<Object> get props => [];
}

class HotelLoaded extends HotelState {
  final HotelEntity hotel;

  const HotelLoaded({required this.hotel});
  @override
  List<Object> get props => [hotel];
}

class HotelError extends HotelState {
  final String message;

  const HotelError({required this.message});
  @override
  List<Object> get props => [message];
}
