import 'user.dart';

class Room {
  final String id;
  final String title;
  final String country;
  final User host;
  final List<User> users;
  final List<String> tags;

  Room({
    required this.id,
    required this.title,
    required this.country,
    required this.host,
    required this.users,
    required this.tags,
  });
}

