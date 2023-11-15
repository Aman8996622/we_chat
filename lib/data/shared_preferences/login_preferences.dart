import 'package:we_chat/data/shared_preferences/const.dart';
import 'package:we_chat/data/shared_preferences/preference_helper.dart';

extension LoginPreference on PreferenceHepler {
  int? get authStatus {
    return sharedPreferences.getInt(Const.authStatus);
  }

  Future<bool> saveAuthStatus({required int authStatus}) async {
    return await sharedPreferences.setInt(Const.authStatus, authStatus);
  }

  String? get phoneNumber {
    return sharedPreferences.getString(Const.phoneNumber);
  }

  Future<bool> savePhoneNumber({
    required String phoneNumber,
  }) async {
    return await sharedPreferences.setString(Const.phoneNumber, phoneNumber);
  }
}
