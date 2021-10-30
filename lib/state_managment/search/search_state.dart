part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Event> events;
  final String textSearched;
  final Jalali? startDate;
  final Jalali? endDate;
  final String? sort;

  SearchLoadedState(this.events, this.textSearched,
      {this.startDate, this.endDate, this.sort});
}

class SearchErrorWhileLoadState extends SearchState {}
