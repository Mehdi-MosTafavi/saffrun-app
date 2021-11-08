import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/search/search_repository.dart';
import 'package:saffrun_app/models/event/event_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late SearchRepository searchRepository;

  SearchCubit() : super(SearchInitial()) {
    searchRepository = SearchRepository();
  }

  Future<void> loadEventHandler(String value) async {
    emit(SearchLoadingState());
    try {
      int page = 1;
      List<Event> events =
          await searchRepository.loadEventFromRepository(value, page);
      emit(SearchLoadedState(events, value));
    } catch (e) {
      emit(SearchErrorWhileLoadState());
    }
  }
}
