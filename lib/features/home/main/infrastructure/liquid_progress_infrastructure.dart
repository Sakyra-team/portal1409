import 'package:portal1409/features/home/main/domain/liquid_progress_domain.dart';

class LiquidProgressService {
  Stream<List<String?>> get statusStream => Stream.periodic(
    const Duration(seconds: 1),
    (_) => liquidProgressDomain(),
  ).asBroadcastStream(); // Чтобы можно было слушать из разных мест
}
