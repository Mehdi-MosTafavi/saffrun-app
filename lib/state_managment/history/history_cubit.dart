import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/history/history_repository.dart';

import '../../models/event/event_model.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  late HistoryRepository historyRepository;

  HistoryCubit() : super(HistoryInitial()) {
    historyRepository = HistoryRepository();
  }

  Future<void> fetchEvent() async {
    emit(HistoryLoading());
    try {
      List<Event> events = await historyRepository.fetchEventFromRepository();
      emit(HistoryLoaded(events: events));
    } catch (e) {
      emit(HistoryError());
    }
  }
}
