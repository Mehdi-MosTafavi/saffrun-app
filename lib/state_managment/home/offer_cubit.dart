import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/models/admin/admin_model.dart';
import 'package:saffrun_app/models/event/event_model.dart';

import '../../data_managment/home/home_repository.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  late HomeRepository homeRepository;

  OfferCubit() : super(OfferInitial()) {
    homeRepository = HomeRepository();
  }

  Future<void> fetchOfferPage() async {
    emit(OfferLoading());
    try {
      Map<String, dynamic> offers = await homeRepository.getOfferList();
      print(offers);
      emit(OfferLoad(offers['events'], offers['businesses']));
    } catch (e) {
      emit(OfferError());
    }
  }
}
