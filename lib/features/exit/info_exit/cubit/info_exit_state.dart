part of 'info_exit_cubit.dart';

sealed class InfoExitState extends Equatable {
  const InfoExitState();

  @override
  List<Object> get props => [];
}

final class InfoExitInitial extends InfoExitState {}

final class InfoExitLoading extends InfoExitState {}

final class InfoExitLoaded extends InfoExitState {}

final class InfoExitError extends InfoExitState {}
