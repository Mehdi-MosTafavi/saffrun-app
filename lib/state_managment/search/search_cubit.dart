import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:saffrun_app/data_managment/search/search_repository.dart';
import 'package:saffrun_app/models/event/event_model.dart';

import '../../models/admin/admin_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late SearchRepository searchRepository;

  SearchCubit() : super(SearchInitial()) {
    searchRepository = SearchRepository();
  }

  Future<void> loadEventHandler(String keyword,
      {Jalali? startDate, Jalali? endDate, String? sort, int? category}) async {
    emit(SearchLoadingState());
    try {
      int page = 1;
      Map<String, dynamic> value = {
        'search_query': keyword,
      };
      if (startDate != null && endDate != null) {
        value['from_datetime'] = startDate.toDateTime().toString();
        value['until_datetime'] = endDate.toDateTime().toString();
      }
      if (sort != null) {
        value['sort'] = sort;
      }
      if (category != -1 && category != null) {
        value['category'] = category;
      }
      Map<String, dynamic> result =
          await searchRepository.loadEventFromRepository(value, page);

      emit(SearchLoadedState(result['events'], result['business'], keyword));
    } catch (e) {
      emit(SearchErrorWhileLoadState());
    }
  }
}
