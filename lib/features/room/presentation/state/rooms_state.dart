part of 'rooms_cubit.dart';


abstract class RoomsState extends Equatable {
  const RoomsState();
}

class RoomsInitial extends RoomsState {
  @override
  List<Object> get props => [];
}

class RoomsLoading extends RoomsState {
  @override
  List<Object> get props => [];
}

class RoomsLoaded extends RoomsState {
  final RoomsEntity rooms;

  const RoomsLoaded({required this.rooms});
  @override
  List<Object> get props => [rooms];
}

class RoomsError extends RoomsState {
  final String message;

  const RoomsError({required this.message});
  @override
  List<Object> get props => [message];
}
