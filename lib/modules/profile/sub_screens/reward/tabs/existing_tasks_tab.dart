import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/components/amount_coin.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/components/selected_amount_coin.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/reward/viewmodel/rewards_tasks_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/app_card.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';

class ExistingTasksTab extends StatefulWidget {
  const ExistingTasksTab({Key? key}) : super(key: key);

  @override
  State<ExistingTasksTab> createState() => _ExistingTasksTabState();
}

class _ExistingTasksTabState extends State<ExistingTasksTab> {
  @override
  void initState() {
    Provider.of<RewardsTasksViewmodel>(context, listen: false).instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RewardsTasksViewmodel>(context);

    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
            ),
            child: ListTile(
              title: model.tasks[index].title,
              description: model.tasks[index].description,
              icon: model.tasks[index].icon,
              amount: model.tasks[index].amount,
              isSelected: model.isSelected(index: index),
              onPressed: () => model.setSelectedTask(index: index),
            ),
          );
        },
        itemCount: model.tasksCount,
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.amount,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String description;
  final String icon;
  final String amount;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AppCard(
        isGreenBottomBorder: isSelected ? true : false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/$icon.svg',
              height: 56.h,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '$title ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.tertiaryBase10,
                        ),
                      ),
                      Text(
                        'Point',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.tertiaryBase10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.tertiary6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 11.w),
            isSelected
                ? SelectedAmountCoin(
                    amount: amount,
                  )
                : AmountCoin(
                    amount: amount,
                  ),
          ],
        ),
      ),
    );
  }
}
