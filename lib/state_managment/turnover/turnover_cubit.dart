import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/turnover/turnover_repository.dart';
import 'package:saffrun_app/models/payment/payment.dart';

part 'turnover_state.dart';

class TurnoverCubit extends Cubit<TurnoverState> {
  late TurnoverRepository turnoverRepository;

  TurnoverCubit() : super(TurnoverInitial()) {
    turnoverRepository = TurnoverRepository();
  }

  Future<void> fetchTurnOver() async {
    emit(TurnoverLoading());
    try {
      Map<String, dynamic> result =
          await turnoverRepository.fetchTurnoverFromRepository();

      emit(TurnoverLoad(
          result['payments'],
          result['chart_date'],
          result['total_payment'],
          result['event_payment'],
          result['reserve_payment']));
    } catch (e) {
      print(e);
      emit(TurnoverError());
    }
  }

  Future<bool> addMoneyToWallet(int x) async {
    return turnoverRepository.turnoverNetworkService.addWallet(x);
    return false;
  }
}
