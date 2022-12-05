class User {
  final int id;
  final String name, email, password, phone;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone});

  factory User.fromJSON(Map parsedJson) {
    return User(
        id: parsedJson['id'],
        name: parsedJson['name'],
        email: parsedJson['email'],
        phone: parsedJson['phone'],
        password: parsedJson['password']);
  }
}
