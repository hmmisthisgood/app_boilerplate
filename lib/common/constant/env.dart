class Env {
  Env(this.baseUrl, this.khaltiapiKey, this.esewaSecret);
  final String baseUrl;
  final String khaltiapiKey;
  final String esewaSecret;
}

class EnvValue {
  static final Env development =
      Env('https://dev.example.com.np/api', "awefa1231232", "12312xwa43qwa3");

  static final Env staging =
      Env('https://qa.example.com.np/api', "awefa1231232", "12312xwa43qwa3");

  static final Env production =
      Env('https://api.example.com.np/api', "awefa1231232", "12312xwa43qwa3");
}
