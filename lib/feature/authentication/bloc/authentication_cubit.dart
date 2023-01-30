import 'package:bloc/bloc.dart';
import 'package:boilerplate/common/http/response.dart';
import 'package:boilerplate/common/shared_pref/shared_pref.dart';

import '../resource/user_repository.dart';
import 'authentication_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository userRepository;

  AuthCubit({required this.userRepository}) : super(AuthUninitialized());

  signUpWithEmail(String email, String password,
      {required String name, required String phoneNumber}) async {
    emit(AuthLoading());
    final response = await userRepository.signUpWithEmail(email, password,
        name: name, phoneNumber: phoneNumber);

    if (response.status == Status.Error) {
      emit(AuthError(message: response.message!));
      return;
    }
    emit(AuthAuthenticated(showLoginToast: false));
  }

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

  loginWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final response =
        await userRepository.loginWithEmailAndPassword(email, password);

    if (response.status == Status.Error) {
      emit(AuthError(message: response.message!));
      return;
    }
    emit(AuthAuthenticated(showLoginToast: false));
  }
}
