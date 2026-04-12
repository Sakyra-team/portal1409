part of 'create_exit_cubit.dart';

sealed class CreateExitState extends Equatable {
  const CreateExitState();

  @override
  List<Object> get props => [];
}

final class CreateExitInitial extends CreateExitState {}

final class CreateExitLoading extends CreateExitState {}

final class CreateExitLoaded extends CreateExitState {
  const CreateExitLoaded({required this.uuid, required this.name, required this.date});

  final String uuid;
  final String name;
  final String date;

  @override
  List<Object> get props => [];
}

final class CreateExitNoCorpuse extends CreateExitState {}

final class CreateExitNoAfford extends CreateExitState {}

final class CreateExitException extends CreateExitState {}
