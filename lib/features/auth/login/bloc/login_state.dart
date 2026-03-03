part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {}

final class LoginExceptionTeacherNotFound extends LoginState {}

final class LoginExceptionSmsSending extends LoginState {}

final class LoginException extends LoginState {}