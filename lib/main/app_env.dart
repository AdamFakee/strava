import 'package:flutter_dotenv/flutter_dotenv.dart';


// ignore: constant_identifier_names
enum SAppEnvEnum { DEV, PRODUCT }

class SAppEnv {
  static SAppEnvEnum _environment = SAppEnvEnum.DEV;
  static Future<void> init(SAppEnvEnum env) async {
    _environment = env;
    switch (_environment) {
      case SAppEnvEnum.DEV: 
        await dotenv.load(fileName: "lib/envs/.env.dev");
        break;
      case SAppEnvEnum.PRODUCT:
        await dotenv.load(fileName: "lib/envs/.env.product");
        break;
    }
  }

  static String? get googleMapApiKey => dotenv.env['GOOGLE_MAP_API_KEY'];

  static String? get baseUrl => dotenv.env['BASE_URL'];

  static String get databaseVersion => dotenv.env['DATABASE_VERSION']!;
}