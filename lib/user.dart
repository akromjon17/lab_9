// user.dart
class User {
  int? id;
  String username;
  String password;
  String phone;
  String email;
  String address;

  User(this.id, this.username, this.password, this.phone, this.email,
      this.address);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
      'phone': phone,
      'email': email,
      'address': address
    };
    return map;
  }

  // user.dart
  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      map['id'],
      map['username'],
      map['password'],
      map['phone'],
      map['email'],
      map['address'],
    );
  }
}
