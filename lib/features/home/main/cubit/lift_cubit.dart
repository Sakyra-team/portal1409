import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';

part 'lift_state.dart';

class LiftCubit extends Cubit<LiftState> {
  LiftCubit({required this.apiClient}) : super(LiftInitial());

  final ApiClient apiClient;

  void lift(int flour) async {
    final response = flour == 1
        ? await apiClient.lift1()
        : flour == 2
        ? await apiClient.lift2()
        : flour == 3
        ? await apiClient.lift3()
        : await apiClient.lift1();
    if (response.status == "success") {
      emit(LiftSeccess());
    } else {
      emit(LiftError());
    }
  }

  void liftInitial() {
    emit(LiftInitial());
  }
}
