// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<AccountRouteArgs> {
  AccountRoute({
    Key? key,
    required String heroTag,
    List<PageRouteInfo>? children,
  }) : super(
         AccountRoute.name,
         args: AccountRouteArgs(key: key, heroTag: heroTag),
         initialChildren: children,
       );

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AccountRouteArgs>();
      return AccountScreen(key: args.key, heroTag: args.heroTag);
    },
  );
}

class AccountRouteArgs {
  const AccountRouteArgs({this.key, required this.heroTag});

  final Key? key;

  final String heroTag;

  @override
  String toString() {
    return 'AccountRouteArgs{key: $key, heroTag: $heroTag}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AccountRouteArgs) return false;
    return key == other.key && heroTag == other.heroTag;
  }

  @override
  int get hashCode => key.hashCode ^ heroTag.hashCode;
}

/// generated route for
/// [CreateExitScreen]
class CreateExitRoute extends PageRouteInfo<void> {
  const CreateExitRoute({List<PageRouteInfo>? children})
    : super(CreateExitRoute.name, initialChildren: children);

  static const String name = 'CreateExitRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateExitScreen();
    },
  );
}

/// generated route for
/// [DevicesScreen]
class DevicesRoute extends PageRouteInfo<void> {
  const DevicesRoute({List<PageRouteInfo>? children})
    : super(DevicesRoute.name, initialChildren: children);

  static const String name = 'DevicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DevicesScreen();
    },
  );
}

/// generated route for
/// [InfoExitScreen]
class InfoExitRoute extends PageRouteInfo<InfoExitRouteArgs> {
  InfoExitRoute({
    Key? key,
    required String uuid,
    required String name,
    required String iat,
    List<PageRouteInfo>? children,
  }) : super(
         InfoExitRoute.name,
         args: InfoExitRouteArgs(key: key, uuid: uuid, name: name, iat: iat),
         initialChildren: children,
       );

  static const String name = 'InfoExitRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfoExitRouteArgs>();
      return InfoExitScreen(
        key: args.key,
        uuid: args.uuid,
        name: args.name,
        iat: args.iat,
      );
    },
  );
}

class InfoExitRouteArgs {
  const InfoExitRouteArgs({
    this.key,
    required this.uuid,
    required this.name,
    required this.iat,
  });

  final Key? key;

  final String uuid;

  final String name;

  final String iat;

  @override
  String toString() {
    return 'InfoExitRouteArgs{key: $key, uuid: $uuid, name: $name, iat: $iat}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InfoExitRouteArgs) return false;
    return key == other.key &&
        uuid == other.uuid &&
        name == other.name &&
        iat == other.iat;
  }

  @override
  int get hashCode =>
      key.hashCode ^ uuid.hashCode ^ name.hashCode ^ iat.hashCode;
}

/// generated route for
/// [ListExitScreen]
class ListExitRoute extends PageRouteInfo<void> {
  const ListExitRoute({List<PageRouteInfo>? children})
    : super(ListExitRoute.name, initialChildren: children);

  static const String name = 'ListExitRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListExitScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}

/// generated route for
/// [SecurityScreen]
class SecurityRoute extends PageRouteInfo<void> {
  const SecurityRoute({List<PageRouteInfo>? children})
    : super(SecurityRoute.name, initialChildren: children);

  static const String name = 'SecurityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SecurityScreen();
    },
  );
}

/// generated route for
/// [ServicesScreen]
class ServicesRoute extends PageRouteInfo<void> {
  const ServicesRoute({List<PageRouteInfo>? children})
    : super(ServicesRoute.name, initialChildren: children);

  static const String name = 'ServicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServicesScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SmsScreen]
class SmsRoute extends PageRouteInfo<SmsRouteArgs> {
  SmsRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
         SmsRoute.name,
         args: SmsRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'SmsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SmsRouteArgs>();
      return SmsScreen(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class SmsRouteArgs {
  const SmsRouteArgs({this.key, required this.phoneNumber});

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SmsRouteArgs) return false;
    return key == other.key && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode;
}

/// generated route for
/// [TabScreen]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
    : super(TabRoute.name, initialChildren: children);

  static const String name = 'TabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabScreen();
    },
  );
}
