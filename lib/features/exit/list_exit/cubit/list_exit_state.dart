part of 'list_exit_cubit.dart';

sealed class ListExitState extends Equatable {
  const ListExitState();

  @override
  List<Object> get props => [];
}

final class ListExitInitial extends ListExitState {}

final class ListExitLoading extends ListExitState {}

final class ListExitLoaded extends ListExitState {
  const ListExitLoaded({required this.list, required this.isOnlyMy});

  final List<HistoryExitAppInfo> list;
  final bool isOnlyMy;

  @override
  List<Object> get props => [list, isOnlyMy];
}

final class ListExitEmpty extends ListExitState {
  const ListExitEmpty({required this.isOnlyMy});

  final bool isOnlyMy;

  @override
  List<Object> get props => [isOnlyMy];

}

final class ListExitException extends ListExitState {}