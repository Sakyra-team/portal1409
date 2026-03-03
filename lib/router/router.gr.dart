// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

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
