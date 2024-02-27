import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/deposit_limit_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/viewmodel/deposit_limit_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/my_activities/my_activities_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/time_out/time_out_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/time_out/viewmodel/timeout_viemmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/viewmodels/activities_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_tab_container.dart';

class ActivitiesScreen extends HookWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  final pages = [
    const MyActivitiesTab(),
    DepositLimitTab(),
    const TimeOutTab(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<ActivitiesTabsViewmodel>(context, listen: false).initialize();
      Provider.of<DepositLimitViewmodel>(context, listen: false).initialize();
      Provider.of<TimeoutViewmodel>(context, listen: false).initialize();
      return null;
    });

    return CustomScaffold(
      title: 'My Activities',
      child:
          Consumer<ActivitiesTabsViewmodel>(builder: (context, model, child) {
        return CustomTabContainer(
          labels: model.labels,
          currentPosition: model.currentPosition,
          pages: pages,
          onPressed: (index) => model.currentPosition = index,
        );
      }),
    );
  }
}
