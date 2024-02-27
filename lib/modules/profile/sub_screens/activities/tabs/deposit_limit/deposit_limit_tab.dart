import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/sub_pages/deposit_limit_main_page.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/sub_pages/deposit_limit_update_page.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/activities/tabs/deposit_limit/viewmodel/deposit_limit_viewmodel.dart';

class DepositLimitTab extends StatelessWidget {
  DepositLimitTab({super.key});

  final pages = [
    const DepositLimitMainPage(),
    const DepositLimitUpdatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        itemBuilder: (_, index) {
          final model = Provider.of<DepositLimitViewmodel>(context);

          /*   return IndexedStack(
            //This will keep the state of the individual screens while switched
            index: model.currentPosition.toInt(),
            children: pages,
          );*/
          return SingleChildScrollView(
            child: pages[model.currentPosition.toInt()],
          );
        });
  }
}
