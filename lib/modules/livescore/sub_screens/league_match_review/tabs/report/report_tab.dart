import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/model/news.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/widgets/full_news_widget.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/widgets/news_card.dart';

class ReportTab extends StatelessWidget {
  ReportTab({Key? key}) : super(key: key);

  var tags = ['League 1', 'Juventus', 'Sampdora'];

  final List<News> news = [
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
    News(
      title: 'Jesus return a ‘massive boost’ for Arsenal. says Odegaard',
      time: '15 hours ago',
      image: 'baller_2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FullNewsWidget(
        tags: tags,
        news: news,
      ),
    );
  }
}
