part of 'history_event_cubit.dart';

@immutable
abstract class HistoryEventState {}

class HistoryEventInitial extends HistoryEventState {}

class HistoryEventLoading extends HistoryEventState {}

class HistoryEventLoaded extends HistoryEventState {
  final List<Reserve> reserves;

  HistoryEventLoaded({this.reserves = const []});
}

class HistoryEventError extends HistoryEventState {}
