
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
  List<Object> get props => [];
}

class HotelError extends HotelState {
  @override
  List<Object> get props => [];
}
