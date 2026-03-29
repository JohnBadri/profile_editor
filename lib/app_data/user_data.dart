class User {
  User({required this.id, required this.name, required this.isAdmin});

  final int id;
  String name;
  bool isAdmin;
}

List<User> allUsers = [
  User(id: 1, name: 'John', isAdmin: true),
  User(id: 2, name: 'Natalie', isAdmin: false),
];
