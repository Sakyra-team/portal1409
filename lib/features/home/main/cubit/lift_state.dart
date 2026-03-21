part of 'lift_cubit.dart';

sealed class LiftState extends Equatable {
  const LiftState();

  @override
  List<Object> get props => [];
}

final class LiftInitial extends LiftState {}

final class LiftSeccess extends LiftState {}

final class LiftError extends LiftState {}