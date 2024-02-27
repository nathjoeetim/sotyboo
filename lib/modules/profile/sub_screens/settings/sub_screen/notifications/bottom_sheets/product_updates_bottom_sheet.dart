import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/notifications_settings_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/settings/sub_screen/notifications/widgets/notification_setting_bottom_sheet_container.dart';

onProductUpdatesPressed({required BuildContext context}) {
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
        builder: (context, scrollController) =>
            const ProductUpdatesBottomSheet()),
  );
}

class ProductUpdatesBottomSheet extends StatelessWidget {
  const ProductUpdatesBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsSettingsViewmodel>(
      builder: (context, model, child) {
        return NotificationSettingBottomSheetContainer(
          title: 'Product Updates',
          description:
              'Get notified about the latest product info and features updates.',
          multiToggle: model.productUpdates,
          onPushNotificationToggle: (value) => model.updateProductUpdates(
            pushNotification: value,
          ),
          onSmsToggle: (value) => model.updateProductUpdates(
            sms: value,
          ),
          onEmailsToggle: (value) => model.updateProductUpdates(
            emails: value,
          ),
        );
      },
    );
  }
}
