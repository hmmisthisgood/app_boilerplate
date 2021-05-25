class User {
  int id;
  String username;
  String firstName;
  String lastName;
  String? phone;
  String? email;
  String? facebookId;
  String? appleId;
  String? googleId;
  bool isEmailVerified;
  bool isPhoneVerified;
  String? forexCurrency;
  String? language;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.facebookId,
    required this.appleId,
    required this.googleId,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.forexCurrency,
    required this.language,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      phone: json['phone'],
      email: json['email'],
      facebookId: json['facebookId'],
      appleId: json['appleId'],
      googleId: json['googleId'],
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      forexCurrency: json['forexCurrency'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['facebookId'] = this.facebookId;
    data['appleId'] = this.appleId;
    data['googleId'] = this.googleId;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isPhoneVerified'] = this.isPhoneVerified;
    data['forexCurrency'] = this.forexCurrency;
    data['language'] = this.language;

    return data;
  }
}
