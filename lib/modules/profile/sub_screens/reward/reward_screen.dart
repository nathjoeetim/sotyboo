import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/tabs/existing_tasks_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/tabs/new_tasks_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/tabs/rewards_page.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/viewmodel/rewards_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_tab_container.dart';

import '../../../../unils/navigation.dart';

class RewardScreen extends HookWidget {
  RewardScreen({Key? key}) : super(key: key);

  final pages = [
    const NewTasksTab(),
    const ExistingTasksTab(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Provider.of<RewardsTabViewmodel>(context, listen: false).initialize();
      return null;
    });

    return CustomScaffold(
      title: 'Rewards',
      child: Consumer<RewardsTabViewmodel>(builder: (context, model, child) {
        return CustomTabContainer(
          labels: model.labels,
          currentPosition: model.currentPosition,
          pages: pages,
          onPressed: (index) {
            if (index == model.labels.length - 1) {
              // Open a new page for "Rewards" tab
              PageRouter.gotoWidget(
                context,
                rootNavigator: true,
                const RewardsPage(),
              );
            } else {
              model.currentPosition = index;
            }
          },
        );
      }),
    );
  }
}
