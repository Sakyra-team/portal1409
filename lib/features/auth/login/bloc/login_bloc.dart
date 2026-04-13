import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.apiClient}) : super(LoginInitial()) {
    on<LoadLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final responce = await apiClient.sendPhone({
          "phone": event.phoneNumber,
        });

        if (responce.status == "error") {
          if (responce.message == "user not found") {
            emit(LoginExceptionTeacherNotFound());
          } else if (responce.message == "error sending code") {
            emit(LoginExceptionSmsSending());
          }
        } else {
          emit(LoginLoaded());
        }
      } catch (e) {
        emit(LoginException());
      }
    });
    on<InitialLoginEvent>((event, emit) {
      emit(LoginInitial());
    });
  }

  final ApiClient apiClient;
}
