import 'package:portal1409/repository/account/account_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepository implements AccountRepositoryInterface {
  const AccountRepository({required this.prefs});

  final SharedPreferences prefs;

  @override
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
  ) async {
    await prefs.setString("name", name);
    await prefs.setInt("groupNumber", groupNumber);
    await prefs.setString("groupLetter", groupLetter);
    await prefs.setString("login", login);
    await prefs.setBool("blockClassExit", blockClassExit);
    await prefs.setString("campus", campus);
    await prefs.setString("card", card);
    await prefs.setString("birthdayData", birthdayData);
    await prefs.setString("extraInfo", extraInfo);
    await prefs.setBool("showContactToColleagues", showContactToColleagues);
  }

  @override
  Future<void> remove() async {
    await prefs.remove("name");
    await prefs.remove("groupNumber");
    await prefs.remove("groupLetter");
    await prefs.remove("login");
    await prefs.remove("blockClassExit");
    await prefs.remove("campus");
    await prefs.remove("card");
    await prefs.remove("birthdayData");
    await prefs.remove("extraInfo");
    await prefs.remove("showContactToColleagues");
  }

  @override
  String? getName() => prefs.getString("name");

  @override
  String? getBirthday() => prefs.getString("birthdayData");

  @override
  String? getLogin() => prefs.getString("login");

  @override
  int? getGroupNumber() => prefs.getInt("groupNumber");

  @override
  String? getGroupSymbol() => prefs.getString("groupLetter");
}
