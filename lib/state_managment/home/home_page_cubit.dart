import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/home/home_repository.dart';
import 'package:saffrun_app/models/event/event_model.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  late HomeRepository homeRepository;

  HomePageCubit() : super(HomePageInitial()) {
    homeRepository = HomeRepository();
  }

  Future<void> fetchHomePage() async {
    emit(HomePageLoading());
    try {
      Map<String, dynamic> result =
          await homeRepository.fetchHomePageRepository();
      emit(HomePageLoad(result['events'] as List<Event>, result['reserves']));
    } catch (e) {
      print(e);
      emit(HomePageError());
    }
  }
}
