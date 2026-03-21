import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/repository/service/service_repository.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceLoading());

  Future<void> addFavorite(int id) async {
    await serviceRepository.saveFavorite(id);

    final List<String>? list = serviceRepository.getFavorite();
    emit(ServiceLoaded(list: list ?? []));
  }

  Future<void> removeFavorite(int id) async {
    await serviceRepository.removeFavorite(id);
    final List<String>? list = serviceRepository.getFavorite();
    emit(ServiceLoaded(list: list ?? []));
  }

  void loadFavorite() {
    emit(ServiceLoading());
    final List<String>? list = serviceRepository.getFavorite();
    list != null ? 
    emit(ServiceLoaded(list: list)) : emit(ServiceSpace());
  }

  Future<void> removeAllFavorite() async {
    await serviceRepository.removeAllFavorite();
    emit(ServiceSpace());
  }

  final serviceRepository = GetIt.I<ServiceRepository>();
}
