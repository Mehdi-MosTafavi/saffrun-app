part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}
class EventLoadingState extends EventState {}
class EventErrorState extends EventState {}
class EventLoadedState extends EventState {}
