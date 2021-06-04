import 'package:boilerplate/common/http/api_provider.dart';

class AuthApiProvider {
  final ApiProvider apiProvider;
  final String baseUrl;

  const AuthApiProvider({
    required this.apiProvider,
    required this.baseUrl,
  });

  Future socialLogin({required String type, required String token}) async {
    var url = "$baseUrl/auth/social";

    return await apiProvider.post(url, {
      "type": type,
      "token": token,
    });
  }

  Future phoneNumberLogin({required String phoneNumber}) async {
    var url = "$baseUrl/signin/generate-token";

    return await apiProvider.post(url, {
      "phone": phoneNumber,
      "countryCode": "+977",
    });
  }

  Future phoneNumberVerify(
      {required String phoneNumber, required String otpCode}) async {
    var url = "$baseUrl/signin/token";

    return await apiProvider.post(url, {
      "phone": phoneNumber,
      "token": otpCode,
      "countryCode": "+977",
    });
  }

  Future fetchUser({required String accessToken}) async {
    var url = "$baseUrl/profile";

    return await apiProvider.get(url, token: accessToken);
  }

  Future updateName(
      String firstName, String lastName, String accessToken) async {
    var url = "$baseUrl/profile";

    return await apiProvider.put(
        url, {"firstName": firstName, "lastName": lastName},
        token: accessToken);
  }
}
