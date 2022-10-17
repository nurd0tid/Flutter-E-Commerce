import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxnow_beta/data/api/api_client.dart';
import 'package:taxnow_beta/models/signup_model.dart';
import 'package:taxnow_beta/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUp signUp) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUp.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
