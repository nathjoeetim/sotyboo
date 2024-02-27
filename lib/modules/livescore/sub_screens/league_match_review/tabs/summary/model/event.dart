import '../components/event_tile.dart';

class Event {
  Event({
    required this.eventType,
    required this.isAway,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.score,
  });

  late final EventType eventType;
  late final bool isAway;
  late final String time;
  late final String title;
  late final String? subtitle;
  late final String? score;
}
