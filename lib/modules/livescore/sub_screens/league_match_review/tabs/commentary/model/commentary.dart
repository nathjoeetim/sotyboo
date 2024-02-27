import '../components/comment_tile.dart';

class Commentary {
  Commentary({
    required this.commentaryType,
    required this.time,
    required this.message,
    required this.image,
  });

  late final CommentaryType commentaryType;
  late final String time;
  late final String message;
  late final String image;
}
