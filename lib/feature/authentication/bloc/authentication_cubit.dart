import 'package:bloc/bloc.dart';
import 'package:boilerplate/common/shared_pref/shared_pref.dart';
import 'package:boilerplate/feature/authentication/resource/user_repository.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationCubit({required this.userRepository})
      : super(AuthenticationUninitialized());

  authStart() async {
    final bool firstTimeAppOpen = await SharedPref.getFirstTimeAppOpen();

    if (firstTimeAppOpen) {
      emit(FirstTimeAppOpen());

      await SharedPref.setFirstTimeAppOpen(false);
    } else {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        emit(AuthenticationAuthenticated(showLoginToast: false));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }
  }

  // login({required String token}) async {D
  //   emit(AuthenticationLoading());
  //   await userRepository.persistToken(token);
  //   emit(AuthenticationAuthenticated());
  // }

  logout() async {
    await userRepository.deleteToken();
    await userRepository.deleteUser();
  }

  // registerWithGoogle() async {
  //   emit(AuthenticationLoading());
  //   final res = await userRepository.googleLogin();
  //   if (res.status == Status.Success) {
  //     emit(AuthenticationAuthenticated(showLoginToast: true));
  //   } else {
  //     emit(AuthenticationError(message: res.message ?? "Unable to login"));
  //   }
  // }

  // registerWithFacebook() async {
  //   emit(AuthenticationLoading());
  //   final res = await userRepository.facebookLogin();
  //   if (res.status == Status.Success) {
  //     emit(AuthenticationAuthenticated(showLoginToast: true));
  //   } else {
  //     emit(AuthenticationError(message: res.message ?? "Unable to login"));
  //   }
  // }

  fetchProfile() async {
    await userRepository.fetchUserProfile();
  }
}
