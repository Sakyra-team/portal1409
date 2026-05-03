part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class AccountLoadingRegistrLink extends AccountState {}


final class AccountLoadedRegistrLink extends AccountState {
  const AccountLoadedRegistrLink({required this.link});
  final String link;

  @override
  List<Object> get props => [link];
}