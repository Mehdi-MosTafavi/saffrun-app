part of 'reserve_cubit.dart';

@immutable
abstract class ReserveState {}

class ReserveInitial extends ReserveState {}

class ReserveLoadingTime extends ReserveState {}

class ReserveLoadedTime extends ReserveState {
  Reserve nearest;
  List<List<Reserve>> reserves;

  ReserveLoadedTime({required this.nearest, required this.reserves});
}

class ReserveSelectedTime extends ReserveState {
  Reserve selectReserve;

  ReserveSelectedTime({required this.selectReserve});
}

class ReserveSendingTime extends ReserveState {}

class ReserveSendSuccess extends ReserveState {}

class ReserveError extends ReserveState {}
