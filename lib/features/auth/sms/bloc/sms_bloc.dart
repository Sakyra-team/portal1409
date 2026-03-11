import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portal1409/api/api.dart';

part 'sms_event.dart';
part 'sms_state.dart';

class SmsBloc extends Bloc<SmsEvent, SmsState> {
  SmsBloc({required this.apiClient}) : super(SmsInitial()) {
    on<LoadSms>((event, emit) async {
      try {
        emit(SmsLoading());
        final response = await apiClient.checkCode({
          "phone": event.phone,
          "code": event.code,
        });
        if (response.status == "error") {
          if (response.message == "wrong code") {
            emit(SmsExceptionWrong());
          } else if (response.message == "teacher not found") {
            emit(SmsExceptionTeacher());
          }
        } else {
          emit(SmsLoaded());
        }
      } catch (e) {
        emit(SmsException());
      }
    });
  }

  final ApiClient apiClient;
}
