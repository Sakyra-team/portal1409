import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';

part 'info_exit_state.dart';

class InfoExitCubit extends Cubit<InfoExitState> {
  InfoExitCubit({required this.apiClient}) : super(InfoExitInitial());

  Future<void> delete(String uuid) async {
    emit(InfoExitLoading());

    final response = await apiClient.closeExitApplication(uuid);

    if (response.status == "success") {
      emit(InfoExitLoaded());
    } else {
      emit(InfoExitError());
    }
  }
  
  final ApiClient apiClient;
}
