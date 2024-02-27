import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/components/odds_container.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/1x2.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/a_h.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/bts.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/cs.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/d_c.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/e_h.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/home_away.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/ht_ft.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/o_e.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/odds/tabs/o_u.dart';

class OddsTab extends StatefulWidget {
  const OddsTab({
    super.key,
  });

  @override
  State<OddsTab> createState() => _OddsTabState();
}

class _OddsTabState extends State<OddsTab> with TickerProviderStateMixin {
  int index = 0;
  late TabController? _tabController;
  OddsType selectedOddsType = OddsType.x12;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  void onOddChipPressed(OddsType oddsType) {
    setState(() {
      selectedOddsType = oddsType;
    });

    // Perform additional actions based on the selected odds type
    switch (oddsType) {
      case OddsType.x12:
        // Handle click for '1X2' odds
        break;
      case OddsType.homeAway:
        // Handle click for 'HOME/AWAY' odds
        break;
      case OddsType.overUnder:
        break;
      case OddsType.asianHandicap:
        break;
      case OddsType.europeanHandicap:
        break;
      case OddsType.doubleChance:
        break;
      case OddsType.halfTimeFullTime:
        break;
      case OddsType.correctScore:
        break;
      case OddsType.oddEven:
        break;
      case OddsType.bothTeamsToScore:
        break;

      // Handle other odds types
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OddsContainer(onChipPressed: onOddChipPressed),
          if (selectedOddsType == OddsType.x12) const OneXTwo(),
          if (selectedOddsType == OddsType.homeAway) const HomeAway(),
          if (selectedOddsType == OddsType.overUnder) const OU(),
          if (selectedOddsType == OddsType.asianHandicap) const AH(),
          if (selectedOddsType == OddsType.oddEven) const OE(),
          if (selectedOddsType == OddsType.bothTeamsToScore) const BTS(),
          if (selectedOddsType == OddsType.europeanHandicap) const EH(),
          if (selectedOddsType == OddsType.doubleChance) const DC(),
          if (selectedOddsType == OddsType.halfTimeFullTime) const HTFT(),
          if (selectedOddsType == OddsType.correctScore) const CS(),
// Add additional if conditions for other odds types
        ],
      ),
    );
  }
}
