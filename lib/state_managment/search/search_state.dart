part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Event> events;
  final String textSearched;

  SearchLoadedState(this.events, this.textSearched);
}

class SearchErrorWhileLoadState extends SearchState {}
