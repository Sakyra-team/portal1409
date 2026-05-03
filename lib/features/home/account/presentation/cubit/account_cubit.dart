import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';
import 'package:portal1409/core/core.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit({required this.apiClient}) : super(AccountInitial());

  Future<void> update(Map<String, dynamic> data) async {
    final response = await apiClient.editTeacherInfo(data);

    if (response.status == "success") {
      showSnack("Изменения соханены");
    } else {
      showSnack("Неизвестная ошибка");
    }
  }

  Future<void> onCreateStudent() async {
    emit(AccountLoadingRegistrLink());
    final response = await apiClient.getRegisterStudentLink();

    final String link = response.link;

    emit(AccountLoadedRegistrLink(link: link));
  }

  final ApiClient apiClient;
}
