import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/components/sectionTitle.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/model/news.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/club_info/tabs/news/widgets/news_card.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/info/components/match_info_card.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/tables/odds_table.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/stats/components/stat_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/event_summary.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/event_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/odds_table_for_summary_page.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/section_title_with_score.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/model/event.dart';

import '../../../../../../core/theme/colors.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 16.w,
          right: 16.w,
          bottom: 22.h,
        ),
        child: Column(
          children: [
            NewsContainer(),
            const SectionTitleWithScore(
              title: '1st Half',
              firstTeamScore: '1',
              secondTeamScore: '1',
            ),
            FirstHalfSummary(),
            const SectionTitleWithScore(
              title: '2nd Half',
              firstTeamScore: '3',
              secondTeamScore: '1',
            ),
            SecondHalfSummary(),
            const SectionTitle(
              title: 'Stats',
              showArrow: false,
            ),
            const StatsContainer(),
            OddsContainerWidget(),
            const SectionTitle(
              title: 'Match Info',
              showArrow: false,
            ),
            const MatchInfoContainer(),
          ],
        ),
      ),
    );
  }
}

class NewsContainer extends StatelessWidget {
  NewsContainer({Key? key}) : super(key: key);

  final News news = News(
    title: 'Juventus 4-2 Sampdoria: Controversial Rabiot goal spares blushes',
    time: '7 hours ago',
    image: 'baller',
  );

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      news: news,
      isBordered: true,
    );
  }
}

class FirstHalfSummary extends StatelessWidget {
  FirstHalfSummary({Key? key}) : super(key: key);

  final List<Event> events = [
    Event(
      eventType: EventType.goal,
      isAway: false,
      time: '13\'',
      title: 'Halland',
      subtitle: 'De Bryune',
      score: '1 - 0',
    ),
    Event(
      eventType: EventType.goal,
      isAway: true,
      time: '33\'',
      title: 'Ronaldo',
      subtitle: 'Fernandes',
      score: '1 - 1',
    ),
    Event(
      eventType: EventType.yellowCard,
      isAway: true,
      time: '45+\'',
      title: 'A. Wan-bissaka',
      subtitle: null,
      score: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return EventSummary(events: events);
  }
}

class SecondHalfSummary extends StatelessWidget {
  SecondHalfSummary({Key? key}) : super(key: key);

  final List<Event> events = [
    Event(
      eventType: EventType.substitution,
      isAway: false,
      time: '60\'',
      title: 'Walker',
      subtitle: null,
      score: null,
    ),
    Event(
      eventType: EventType.substitution,
      isAway: true,
      time: '77\'',
      title: 'Anthony',
      subtitle: null,
      score: null,
    ),
    Event(
      eventType: EventType.goal,
      isAway: false,
      time: '80\'',
      title: 'Halland',
      subtitle: 'Foden',
      score: '2 - 1',
    ),
    Event(
      eventType: EventType.yellowCard,
      isAway: false,
      time: '82\'',
      title: 'Rodri',
      subtitle: null,
      score: null,
    ),
    Event(
      eventType: EventType.redCard,
      isAway: true,
      time: '85\'',
      title: 'Fred',
      subtitle: null,
      score: null,
    ),
    Event(
      eventType: EventType.penaltyMissed,
      isAway: false,
      time: '90+1\'',
      title: 'Foden',
      subtitle: null,
      score: null,
    ),
    Event(
      eventType: EventType.penaltyGoal,
      isAway: false,
      time: '90+1\'',
      title: 'Gundogan',
      subtitle: null,
      score: '3 - 1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return EventSummary(events: events);
  }
}

class StatsContainer extends StatelessWidget {
  const StatsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border.all(color: AppColors.tertiary3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: const StatTile(
        title: 'Possession (%)',
        homeTeamWinCount: 60,
        awayTeamWinCount: 40,
      ),
    );
  }
}

class OddsContainerWidget extends StatelessWidget {
  OddsContainerWidget({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'company': 'assets/images/1xbet.png',
      '1': {
        'value': 1.79,
        'isDown': true,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
    {
      'company': 'assets/images/betway.png',
      '1': {
        'value': 1.79,
        'isDown': true,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
    {
      'company': 'assets/images/bet9ja.png',
      '1': {
        'value': 1.79,
        'isDown': true,
      },
      'x': {
        'value': 4.16,
        'isDown': false,
      },
      '2': {
        'value': 4.28,
        'isDown': false,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return OddsTable1X2ForSummaryPage(data: data);
  }
}

class MatchInfoContainer extends StatelessWidget {
  const MatchInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MatchInfoCard();
  }
}
