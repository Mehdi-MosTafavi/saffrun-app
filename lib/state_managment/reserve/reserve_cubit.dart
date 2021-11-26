import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saffrun_app/data_managment/reserve/reserve_repository.dart';
import 'package:saffrun_app/models/reserve/reserve.dart';

part 'reserve_state.dart';

class ReserveCubit extends Cubit<ReserveState> {
  late ReserveRepository reserveRepository;

  ReserveCubit() : super(ReserveInitial()) {
    reserveRepository = ReserveRepository();
  }

  Future<void> loadTimeReserve(int adminId) async {
    try {
      emit(ReserveLoadingTime(isActive: true));

      Map<String, dynamic> data =
          await reserveRepository.getTimesForReserve(adminId);
      print(data);
      emit(ReserveLoadedTime(
          nearest: data['nearest'], reserves: data['list_reserve']));
    } catch (e) {
      print(e);
      print('error injas');
      emit(ReserveError());
    }
  }

  void selectedReserve(Reserve id) {
    emit(ReserveSelectedTime(selectReserve: id));
  }
}
