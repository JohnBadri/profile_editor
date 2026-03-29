class User {
  const User({required this.id, required this.name, required this.isAdmin});

  final int id;
  final String name;
  final bool isAdmin;
}

List<User> allUsers = [
  User(id: 1, name: 'John', isAdmin: true),
];
