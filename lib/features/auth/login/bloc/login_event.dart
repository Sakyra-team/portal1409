part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class InitialLoginEvent extends LoginEvent {
  const InitialLoginEvent();
}

final class LoadLogin extends LoginEvent {
  const LoadLogin({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}