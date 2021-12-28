part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoad extends HomePageState {
  final List<Event> events;
  final List<Reserve> reserves;

  HomePageLoad(this.events, this.reserves);
}

class HomePageError extends HomePageState {}
