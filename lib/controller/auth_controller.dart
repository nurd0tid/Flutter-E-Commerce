import 'package:get/get.dart';
import 'package:taxnow_beta/data/repository/auth_repo.dart';
import 'package:taxnow_beta/models/signup_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUp signUp) {
    _isLoading = true;
  }
}
