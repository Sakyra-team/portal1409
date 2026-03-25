import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';
import 'package:portal1409/api/models/history_exit_app_info.dart';

part 'list_exit_state.dart';

class ListExitCubit extends Cubit<ListExitState> {
  ListExitCubit({required this.apiClient}) : super(ListExitLoading());

  Future<List> loadListExit(bool isOnlyMy) async {
    emit(ListExitLoading());
    final response = await apiClient.getExitAppHistory(!isOnlyMy);
    response.isNotEmpty ? emit(ListExitLoaded(list: response, isOnlyMy: isOnlyMy)) : emit(ListExitEmpty(isOnlyMy: isOnlyMy));
    return response;
  }

  final ApiClient apiClient;
}
