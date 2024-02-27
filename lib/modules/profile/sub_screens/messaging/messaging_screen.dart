import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/tabs/drafts_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/tabs/inbox_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/tabs/new_message_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/tabs/sent_messages_tab.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_tab_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_tab_container.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/modules/profile/components/custom_app_bar.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class MessagingScreen extends HookWidget {
  MessagingScreen({Key? key}) : super(key: key);

  final pages = [
    const NewMessageTab(),
    const InboxTab(),
    const SentMessagesTab(),
    const DraftTab(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Provider.of<ActivitiesTabsViewmodel>(context, listen: false).initialize();
      // Provider.of<DepositLimitViewmodel>(context, listen: false).initialize();
      // Provider.of<TimeoutViewmodel>(context, listen: false).initialize();
      return null;
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MessagingAppBar(),
            Expanded(
              child: Container(
                width: double.maxFinite,
                color: AppColors.tertiary0,
                child: Consumer<MessagingTabViewmodel>(
                  builder: (context, model, child) {
                    return CustomTabContainer(
                      labels: model.labels,
                      currentPosition: model.currentPosition,
                      pages: pages,
                      onPressed: (index) => model.currentPosition = index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagingAppBar extends StatelessWidget {
  const MessagingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagingTabViewmodel>(builder: (context, tabModel, child) {
      return Consumer<MessagingViewmodel>(builder: (context, model, child) {
        if (tabModel.currentPosition == 0) {
          return const CustomAppBar(
            title: 'Messaging',
          );
        } else {
          if (model.selectedChats.isEmpty) {
            return CustomAppBar(
              title: 'Messaging',
              trailing: InkWell(
                onTap: () {
                  // model.markAllAsRead();
                  // Toggle the select mode and clear selected chats
                  if (!model.isSelectMode) {
                    model.isSelectMode = true;
                  } else {
                    model.isSelectMode = false;
                  }
                  //model.clearSelectedChats();
                },
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      width: 1.h,
                      color: AppColors.primaryBase6,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 16.h,
                          width: 16.h,
                          decoration: BoxDecoration(
                            color: model.isSelectMode
                                ? AppColors.primaryBase6
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.h,
                              color: AppColors.primaryBase6,
                            ),
                          ),
                          child: model.isSelectMode
                              ? SvgPicture.asset(
                                  getSvg('check'),
                                  height: 10.h,
                                  width: 10.w,
                                  fit: BoxFit.scaleDown,
                                )
                              : const SizedBox.shrink()),
                      SizedBox(width: 4.w),
                      Text(
                        'Select',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBase6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.h,
                    color: AppColors.tertiary3,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      model.clearSelectedChats();
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: SvgPicture.asset(
                          getSvg('close'),
                          color: AppColors.tertiaryBase10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    model.selectedChats.length.toString(),
                    style: TextStyle(
                      color: AppColors.tertiaryBase10,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: AppColors.tertiary3,
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    child: Row(
                      children: [
                        // Select All Button
                        InkWell(
                          onTap: () {
                            // model.markAllAsRead();
                            // Toggle the select mode and clear selected chats
                            //model.toggleSelectMode();
                            if (model.areAllChatsSelected()) {
                              model.clearSelectedChats();
                            } else {
                              model.selectAllChats();
                            }

                            //model.clearSelectedChats();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              color: AppColors.tertiary2,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 16.h,
                                    decoration: BoxDecoration(
                                      color: model.areAllChatsSelected()
                                          ? AppColors.primaryBase6
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.h,
                                        color: AppColors.primaryBase6,
                                      ),
                                    ),
                                    child: model.areAllChatsSelected()
                                        ? SvgPicture.asset(
                                            getSvg('check'),
                                            height: 10.h,
                                            width: 10.w,
                                            fit: BoxFit.scaleDown,
                                          )
                                        : const SizedBox.shrink()),
                                SizedBox(width: 4.w),
                                Text(
                                  'Select all',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryBase6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        // Delete All Button
                        InkWell(
                          onTap: () {
                            /// Delete Message
                            model.deleteSelectedChats();
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: const BoxDecoration(
                              color: AppColors.tertiary1,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              getSvg('trash-2'),
                              height: 24.h,
                              width: 24.w,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
      });
    });
  }
}
