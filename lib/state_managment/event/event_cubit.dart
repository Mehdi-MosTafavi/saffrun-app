import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/event/event_repository.dart';

import '../../models/event/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  late EventRepository eventRepository;

  EventCubit() : super(EventInitial()) {
    eventRepository = EventRepository();
  }

  Future<void> fetchEvent(int id) async {
    emit(EventLoadingState());
    try {
      Event event = await eventRepository.fetchEvent(id);
      emit(EventLoadedState(event));
    } catch (e) {
      print(e);
      emit(EventErrorState());
    }
  }

  Future<bool> sendParticipant(int id) async {
    try {
      return await eventRepository.eventNetworkService
          .addParticipantRequest(id);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
