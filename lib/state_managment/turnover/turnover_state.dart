part of 'turnover_cubit.dart';

@immutable
abstract class TurnoverState {}

class TurnoverInitial extends TurnoverState {}

class TurnoverLoading extends TurnoverState {}

class TurnoverLoad extends TurnoverState {
  final int eventPayment;
  final int reservePayment;
  final int totalPayment;
  final List data;
  final List<PaymentData> payments;

  TurnoverLoad(this.payments, this.data, this.totalPayment, this.eventPayment,
      this.reservePayment);
}

class TurnoverError extends TurnoverState {}
