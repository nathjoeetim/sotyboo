import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/widgets/notification_setting_bottom_sheet_container.dart';

onBetUpdatesPressed({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.r),
        topRight: Radius.circular(32.r),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.613,
        maxChildSize: 0.613,
        builder: (context, scrollController) => const BetUpdatesBottomSheet()),
  );
}

class BetUpdatesBottomSheet extends StatelessWidget {
  const BetUpdatesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsSettingsViewmodel>(
      builder: (context, model, child) {
        return NotificationSettingBottomSheetContainer(
          title: 'Bet Updates',
          description:
              'Get notified about important activities on your placed bets.',
          multiToggle: model.betUpdates,
          onPushNotificationToggle: (value) => model.updateBetUpdates(
            pushNotification: value,
          ),
          onSmsToggle: (value) => model.updateBetUpdates(
            sms: value,
          ),
          onEmailsToggle: (value) => model.updateBetUpdates(
            emails: value,
          ),
        );
      },
    );
  }
}
