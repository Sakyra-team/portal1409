import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';

part 'create_exit_state.dart';

class CreateExitCubit extends Cubit<CreateExitState> {
  CreateExitCubit({required this.apiClient}) : super(CreateExitInitial());

  Future<void> createApplication(
    String fio,
    String groupNumber,
    String groupLetter,
    String cause,
    String time,
  ) async {
    try {
      emit(CreateExitLoading());

      final response = await apiClient.createExitApplication({
        "fio": fio,
        "group_number": groupNumber,
        "group_letter": groupLetter,
        "cause": cause,
        "time": time,
      });

      if (response.status == "success") {
        emit(CreateExitLoaded());
      } else {
        if (response.message ==
            "Вы не можете создавать заявки для этого корпуса") {
          emit(CreateExitNoCorpuse());
        } else if (response.message ==
            "Выход для этого класса запрещен классным руководителем") {
          emit(CreateExitNoAfford());
        }
      }
    } catch (e) {
      emit(CreateExitException());
    }
  }

  final ApiClient apiClient;
}
