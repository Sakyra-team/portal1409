part of 'list_exit_cubit.dart';

sealed class ListExitState extends Equatable {
  const ListExitState();

  @override
  List<Object> get props => [];
}

final class ListExitInitial extends ListExitState {}

final class ListExitLoading extends ListExitState {}

final class ListExitLoaded extends ListExitState {
  const ListExitLoaded({required this.list});

  final List<HistoryExitAppInfo> list;

  @override
  List<Object> get props => [list];
}

final class ListExitEmpty extends ListExitState {}

final class ListExitException extends ListExitState {}