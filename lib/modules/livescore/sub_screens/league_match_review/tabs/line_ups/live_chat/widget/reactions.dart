import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/line_ups/live_chat/components/reaction.dart';

class Reactions extends StatelessWidget {
  const Reactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (index) => Reaction(
          reactionType: ReactionType.flame,
          numbers: 3,
          onPressed: () {
            ////
            log('Reacted...');
          },
        ),
      ),
    );
  }
}
