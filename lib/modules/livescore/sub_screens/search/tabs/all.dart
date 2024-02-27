import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/search/tabs/players.dart';

import '../../../components/sectionTitle.dart';
import '../../favourite/tabs/competitions.dart';
import '../../favourite/tabs/teams.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(title: 'Competitions'),
        const Competitions(verticalPadding: false),
        const SectionTitle(title: 'Teams'),
        const Teams(verticalPadding: false),
        const SectionTitle(title: 'Players'),
        const Players(verticalPadding: false),
        SizedBox(height: 16.h),
      ],
    );
  }
}
