part of 'offer_cubit.dart';

@immutable
abstract class OfferState {}

class OfferInitial extends OfferState {}

class OfferLoading extends OfferState {}

class OfferLoad extends OfferState {
  final List<Event> events;
  final List<Admin> admins;

  OfferLoad(this.events, this.admins);
}

class OfferError extends OfferState {}
