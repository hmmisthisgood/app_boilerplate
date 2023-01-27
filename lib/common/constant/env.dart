class Env {
  Env(this.baseUrl, this.khaltiapiKey, this.esewaSecret);
  final String baseUrl;
  final String khaltiapiKey;
  final String esewaSecret;
}

class EnvValue {
  static final Env development = Env(
      'https://ecommerce-api-3sb4.onrender.com/api',
      "awefa1231232",
      "12312xwa43qwa3");

  static final Env qa = Env('https://ecommerce-api-3sb4.onrender.com/api',
      "awefa1231232", "12312xwa43qwa3");

  static final Env production = Env(
      'https://ecommerce-api-3sb4.onrender.com/api',
      "awefa1231232",
      "12312xwa43qwa3");
}
