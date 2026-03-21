abstract interface class ServiceRepositoryAbstract {
  Future<void> saveFavorite(int id);
  List<String>? getFavorite();
  Future<void> removeFavorite(int id);
  Future<void> removeAllFavorite();
}