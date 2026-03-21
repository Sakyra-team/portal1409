part of 'service_cubit.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceLoaded extends ServiceState {
  const ServiceLoaded({required this.list});

  final List<String> list;

  @override
  List<Object> get props => [list];
}

final class ServiceSpace extends ServiceState {}