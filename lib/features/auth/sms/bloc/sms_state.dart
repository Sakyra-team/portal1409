part of 'sms_bloc.dart';

sealed class SmsState extends Equatable {
  const SmsState();
  
  @override
  List<Object> get props => [];
}

final class SmsInitial extends SmsState {}

final class SmsLoading extends SmsState {}

final class SmsLoadingAccountInfo extends SmsState {}

final class SmsLoaded extends SmsState {}

final class SmsException extends SmsState {}

final class SmsExceptionWrong extends SmsState {}

final class SmsExceptionTeacher extends SmsState {}