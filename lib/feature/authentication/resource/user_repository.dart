import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:boilerplate/common/constant/env.dart';
import 'package:boilerplate/common/http/api_provider.dart';
import 'package:boilerplate/common/http/custom_exception.dart';
import 'package:boilerplate/common/http/response.dart';
import 'package:boilerplate/common/shared_pref/shared_pref.dart';
import 'package:boilerplate/common/util/internet_check.dart';
import 'package:boilerplate/common/util/log.dart';
import 'package:boilerplate/feature/authentication/model/user.dart';

import 'auth_api_provider.dart';

class UserRepository {
  ApiProvider apiProvider;
  late AuthApiProvider authApiProvider;
  InternetCheck internetCheck;
  Env env;

  final String _tokenKey = "appAccessToken";
  static String _token = '';
  static ValueNotifier<User?> _user = ValueNotifier(null);

  UserRepository({
    required this.env,
    required this.apiProvider,
    required this.internetCheck,
  }) {
    authApiProvider = AuthApiProvider(
      baseUrl: env.baseUrl,
      apiProvider: apiProvider,
    );

    print(authApiProvider);
  }

  Future initialState() async {
    _token = await fetchToken();
    _user.value = await SharedPref.getUser();
  }

  Future<bool> deleteAll() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    try {
      await storage.deleteAll();
      return true;
    } on Exception catch (e) {
      Log.e(e);
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<bool> deleteToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    try {
      _token = '';
      _isLoggedIn.value = false;
      await storage.delete(key: _tokenKey);
      return true;
    } on Exception catch (e) {
      Log.e(e);
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<bool> persistToken(String token) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    try {
      await storage.write(key: _tokenKey, value: token);
      _isLoggedIn.value = true;
      return true;
    } on Exception catch (e) {
      Log.e(e);
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<bool> hasToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    try {
      String? token = await storage.read(key: _tokenKey);
      if (token != null) {
        _isLoggedIn.value = true;
      }
      return token != null;
    } on Exception catch (e) {
      Log.e(e);
      print('custom exception is been obtained');
    }
    return false;
  }

  Future<String> fetchToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    String token = '';
    try {
      token = await storage.read(key: _tokenKey) ?? "";
      if (token.isNotEmpty) {
        _token = token;
      }
    } on Exception catch (e) {
      Log.e(e);
      print('custom exception is been obtained');
    }
    return token;
  }

  ValueNotifier<User?> get user => _user;

  String get token => _token;

  ValueNotifier<bool> _isLoggedIn = ValueNotifier(false);

  ValueNotifier<bool> get isLoggedIn => _isLoggedIn;

  // Future<DataResponse<User>> facebookLogin() async {
  //   try {
  //     final LoginResult result =
  //         await FacebookAuth.instance.login(permissions: ['email']);
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;
  //       final _res = await authApiProvider.socialLogin(
  //           type: "facebook", token: accessToken.token);
  //       final _result = Map<String, dynamic>.from(_res);
  //       _token = _result['data']['accessToken'];
  //       await persistToken(_token);
  //       _user.value = User.fromJson(_result['data']);
  //       SharedPref.setUser(_user.value!);
  //       _isLoggedIn.value = true;
  //       return DataResponse.success(_user.value!);
  //     } else if (result.status == LoginStatus.failed) {
  //       return DataResponse.error(result.message);
  //     } else {
  //       return DataResponse.error("Unable to login!!");
  //     }
  //   } on CustomException catch (e) {Log.e(e);
  //     return DataResponse.error(e.message!);
  //   } catch (e) {Log.e(e);
  //     return DataResponse.error(e.toString());
  //   }
  // }

  // Future<DataResponse> googleLogin() async {
  //   try {
  //     GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  //     final googleUser = await _googleSignIn.signIn();

  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       print(googleAuth.accessToken);
  //       final _res = await authApiProvider.socialLogin(
  //           type: "google", token: googleAuth.accessToken!);
  //       final _result = Map<String, dynamic>.from(_res);
  //       _token = _result['data']['accessToken'];
  //       await persistToken(_token);
  //       _user.value = User.fromJson(_result['data']);
  //       SharedPref.setUser(_user.value!);
  //       _isLoggedIn.value = true;
  //       return DataResponse.success(_user.value);
  //     } else {
  //       return DataResponse.error("Unable to Login!!");
  //     }
  //   } on CustomException catch (e) {Log.e(e);
  //     return DataResponse.error(e.message!);
  //   } catch (e) {Log.e(e);
  //     return DataResponse.error(e.toString());
  //   }
  // }

  Future<DataResponse> registerPhoneNumber(
      {required String phoneNumber}) async {
    try {
      await authApiProvider.phoneNumberLogin(phoneNumber: phoneNumber);
      return DataResponse.success(true);
    } on CustomException catch (e) {
      Log.e(e);
      return DataResponse.error(e.message!);
    } catch (e) {
      Log.e(e);
      return DataResponse.error(e.toString());
    }
  }

  Future<DataResponse> verifyPhoneNumber(
      {required String phoneNumber, required String otp}) async {
    try {
      final _res = await authApiProvider.phoneNumberVerify(
          phoneNumber: phoneNumber, otpCode: otp);
      final _result = Map<String, dynamic>.from(_res);
      _token = _result['data']['accessToken'];
      await persistToken(_token);
      _user.value = User.fromJson(_result['data']);
      SharedPref.setUser(_user.value!);
      _isLoggedIn.value = true;
      return DataResponse.success(_user.value);
    } on CustomException catch (e) {
      Log.e(e);
      return DataResponse.error(e.message!);
    } catch (e) {
      Log.e(e);
      return DataResponse.error(e.toString());
    }
  }

  Future deleteUser() async {
    SharedPref.deleteUser();
    _user.value = null;
  }

  Future<DataResponse<User>> fetchUserProfile() async {
    if (_token.isEmpty) {
      return DataResponse.error("Unauthenticaed");
    }
    try {
      final _res = await authApiProvider.fetchUser(accessToken: _token);
      final _result = Map<String, dynamic>.from(_res);
      _user.value = User.fromJson(_result['data']['data']);
      SharedPref.setUser(_user.value!);
      // BlocProvider.of<SettingsCubit>(Nav.context)
      //     .updateUserSetting(_user.value!);
      _isLoggedIn.value = true;
      return DataResponse.success(_user.value);
    } on CustomException catch (e) {
      Log.e(e);
      return DataResponse.error(e.message!);
    } catch (e) {
      Log.e(e);
      return DataResponse.error(e.toString());
    }
  }

  Future<DataResponse<User>> updateName(
      {required String firstName, required String lastName}) async {
    try {
      final _res = await authApiProvider.updateName(firstName, lastName, token);
      final _result = Map<String, dynamic>.from(_res);
      _user.value = User.fromJson(_result['data']['data']);
      SharedPref.setUser(_user.value!);
      // BlocProvider.of<SettingsCubit>(Nav.context)
      //     .updateUserSetting(_user.value!);
      return DataResponse.success(_user.value);
    } on CustomException catch (e) {
      Log.e(e);
      return DataResponse.error(e.message!);
    } catch (e) {
      Log.e(e);
      return DataResponse.error(e.toString());
    }
  }
}
