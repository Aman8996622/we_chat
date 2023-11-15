import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_chat/data/shared_preferences/preference_helper.dart';
import 'package:we_chat/presentation/screen/phone_auth_screen/phone_auth_screen.dart';

final injector = GetIt.instance;

Future<void> initialised() async {
  injector.registerSingleton<PreferenceHepler>(
    PreferenceHepler(
      await SharedPreferences.getInstance(),
    ),
  );
}
