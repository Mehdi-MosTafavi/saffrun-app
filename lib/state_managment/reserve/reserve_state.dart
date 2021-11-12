part of 'reserve_cubit.dart';

@immutable
abstract class ReserveState {}

class ReserveInitial extends ReserveState {}

class ReserveLoadingTime extends ReserveState {
  final bool isActive;

  ReserveLoadingTime({required this.isActive});
}

class ReserveLoadedTime extends ReserveState {
  final Reserve nearest;
  final List<List<Reserve>> reserves;

  ReserveLoadedTime({required this.nearest, required this.reserves});
}

class ReserveSelectedTime extends ReserveState {
  final Reserve selectReserve;

  ReserveSelectedTime({required this.selectReserve});
}

class ReserveSendingTime extends ReserveState {}

class ReserveSendSuccess extends ReserveState {}

class ReserveError extends ReserveState {}
