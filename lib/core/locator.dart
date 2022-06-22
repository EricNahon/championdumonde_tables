import 'package:get_it/get_it.dart';

import '../app/app_controller.dart';
import '../auth/auth_controller.dart';
import '../sound/sound_controller.dart';

final locator = GetIt.instance;

void registerSingletons() {
  locator.registerSingleton<SoundController>(SoundController());
  locator.registerSingleton<AuthController>(AuthController());
  locator.registerSingleton<AppController>(AppController());
}

SoundController get soundController => GetIt.instance.get<SoundController>();
AuthController get authController => GetIt.instance.get<AuthController>();
AppController get appController => GetIt.instance.get<AppController>();
