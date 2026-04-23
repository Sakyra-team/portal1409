import 'dart:io';

bool isUseIos26() {
  if (Platform.isIOS) {
    final String iosVersion = Platform.operatingSystemVersion.split(" ")[1];

    final String version = iosVersion.split(".")[0];

    if (version == "26") {
      return true;
    }
  }

  return false;
}
