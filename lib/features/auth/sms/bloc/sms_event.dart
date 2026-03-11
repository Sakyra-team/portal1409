part of 'sms_bloc.dart';

sealed class SmsEvent extends Equatable {
  const SmsEvent();

  @override
  List<Object> get props => [];
}

final class LoadSms extends SmsEvent {
  const LoadSms({required this.phone, required this.code});

  final String phone;
  final String code;

  @override
  List<Object> get props => [phone, code];
}