class Env {
  Env(this.baseUrl, this.imageUrl);
  final String baseUrl;
  final String imageUrl;
}

mixin EnvValue {
  static final Env development = Env('https://newsapi.ayaanshtech.com.np/api',
      'https://newsapi.ayaanshtech.com.np/api');
  static final Env staging = Env('https://newsapi.ayaanshtech.com.np/api',
      'https://newsapi.ayaanshtech.com.np/api');
  static final Env production = Env('https://newsapi.ayaanshtech.com.np/api',
      'https://newsapi.ayaanshtech.com.np/api');
}
