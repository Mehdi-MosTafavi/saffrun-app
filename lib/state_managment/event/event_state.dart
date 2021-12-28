part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}
class EventLoadingState extends EventState {}

class EventLoadedState extends EventState {
  final Event event;

  EventLoadedState(this.event);
}

class EventErrorState extends EventState {}
