abstract interface class AccountRepositoryInterface {
  Future<void> save(
    String name,
    int groupNumber,
    String groupLetter,
    String login,
    bool blockClassExit,
    String campus,
    String card,
    String birthdayData,
    String extraInfo,
    bool showContactToColleagues,
  );

  Future<void> remove();

  String? getName();

  String? getBirthday();

  String? getLogin();

  int? getGroupNumber();

  String? getGroupSymbol();
}
