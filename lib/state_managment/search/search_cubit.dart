import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/data_managment/search/search_repository.dart';
import 'package:saffrun_app/models/event/event_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late SearchRepository searchRepository;

  SearchCubit() : super(SearchInitial()) {
    searchRepository = SearchRepository();
  }

  Future<void> loadEventHandler(String keyword,
      {Jalali? startDate, Jalali? endDate, String? sort}) async {
    emit(SearchLoadingState());
    try {
      int page = 1;
      Map<String, String> value = {
        'search_query': keyword,
      };
      if (startDate != null && endDate != null) {
        value['from_datetime'] = startDate.toString();
        value['until_datetime'] = endDate.toString();
      }
      if (sort != null) {
        value['sort'] = sort;
      }
      List<Event> events =
          await searchRepository.loadEventFromRepository(value, page);
      emit(SearchLoadedState(events, keyword));
    } catch (e) {
      emit(SearchErrorWhileLoadState());
    }
  }
}
