class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      };
}
