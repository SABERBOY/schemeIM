import 'user.dart';

class Room {
  final String id;
  final String title;
  final String? description;
  final String countryFlag;
  final List<String> tags;
  final User host;
  final List<RoomSeat> seats;
  final int onlineCount;

  Room({
    required this.id,
    required this.title,
    this.description,
    required this.countryFlag,
    required this.tags,
    required this.host,
    required this.seats,
    required this.onlineCount,
  });
}

class RoomSeat {
  final int index;
  final String? userId;
  final User? user;
  final bool isMuted;
  final bool isLocked;

  RoomSeat({
    required this.index,
    this.userId,
    this.user,
    required this.isMuted,
    required this.isLocked,
  });
}
