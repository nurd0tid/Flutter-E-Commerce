import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxnow_beta/data/api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });
}
