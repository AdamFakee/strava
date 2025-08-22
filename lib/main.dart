import 'package:strava/main/app_env.dart';
import 'package:strava/main/main_common.dart';

// entry point for product environment
Future main () async => await mainCommon(SAppEnvEnum.PRODUCT);