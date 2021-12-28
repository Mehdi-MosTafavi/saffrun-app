part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<Event> events;

  HistoryLoaded({this.events = const []});
}

class HistoryError extends HistoryState {}
