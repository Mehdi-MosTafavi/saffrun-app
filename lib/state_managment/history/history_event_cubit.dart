import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_managment/history/history_repository.dart';
import '../../models/reserve/reserve.dart';

part 'history_event_state.dart';

class HistoryReserveCubit extends Cubit<HistoryEventState> {
  late HistoryRepository historyRepository;

  HistoryReserveCubit() : super(HistoryEventInitial()) {
    historyRepository = HistoryRepository();
  }

  Future<void> fetchReserve() async {
    emit(HistoryEventLoading());
    try {
      List<Reserve> events =
          await historyRepository.fetchReserveFromRepository();
      emit(HistoryEventLoaded(reserves: events));
    } catch (e) {
      emit(HistoryEventError());
    }
  }
}
