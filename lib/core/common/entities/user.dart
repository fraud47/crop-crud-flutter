

class User {
  final int id;
  final String email;
  final String name;

  const User({
    required this.id,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name
  ];
}
