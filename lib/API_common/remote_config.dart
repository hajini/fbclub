
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String> checkVersion() async {

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String buildNumber = packageInfo.buildNumber;

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setDefaults(<String, dynamic>{
    'latest_ver_android': 'default latest_ver_android',
    'min_ver_android': 'default min_ver_android',
  });

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.fetch();
  await remoteConfig.fetchAndActivate();
  // RemoteConfigValue(null, ValueSource.valueStatic);
  String latest = remoteConfig.getString('latest_ver_android');
  String min = remoteConfig.getString('min_ver_android');

  int build = int.tryParse(buildNumber) ?? 0;
  int minVersion = int.tryParse(min) ?? 0;
  int latestVersion = int.tryParse(latest) ?? 0;

  if (minVersion > build) {
    return 'update';
  } else {
    if (latestVersion > build) {
      return 'recommend';
    }
  }

  return 'keep';
}