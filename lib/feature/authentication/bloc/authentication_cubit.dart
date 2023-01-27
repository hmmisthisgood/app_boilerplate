import 'package:bloc/bloc.dart';
import 'package:boilerplate/common/shared_pref/shared_pref.dart';

import '../resource/user_repository.dart';
import 'authentication_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository userRepository;

  AuthCubit({required this.userRepository}) : super(AuthUninitialized());

  authStart() async {
    final bool firstTimeAppOpen = await SharedPref.getFirstTimeAppOpen();

    if (firstTimeAppOpen) {
      emit(FirstTimeAppOpen());

      await SharedPref.setFirstTimeAppOpen(false);
    } else {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        emit(AuthAuthenticated(showLoginToast: false));
      } else {
        emit(AuthUnauthenticated());
      }
    }
  }

  // login({required String token}) async {D
  //   emit(AuthLoading());
  //   await userRepository.persistToken(token);
  //   emit(AuthAuthenticated());
  // }

  logout() async {
    await userRepository.deleteToken();
    await userRepository.deleteUser();
  }

  // registerWithGoogle() async {
  //   emit(AuthLoading());
  //   final res = await userRepository.googleLogin();
  //   if (res.status == Status.Success) {
  //     emit(AuthAuthenticated(showLoginToast: true));
  //   } else {
  //     emit(AuthError(message: res.message ?? "Unable to login"));
  //   }
  // }

  // registerWithFacebook() async {
  //   emit(AuthLoading());
  //   final res = await userRepository.facebookLogin();
  //   if (res.status == Status.Success) {
  //     emit(AuthAuthenticated(showLoginToast: true));
  //   } else {
  //     emit(AuthError(message: res.message ?? "Unable to login"));
  //   }
  // }

  fetchProfile() async {
    await userRepository.fetchUserProfile();
  }

  loginWithEmailAndPassword(String email, String password) {
    userRepository.loginWithEmailAndPassword(email, password);
  }
}
