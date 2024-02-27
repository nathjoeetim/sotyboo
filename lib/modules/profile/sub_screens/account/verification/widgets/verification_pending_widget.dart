import 'package:flutter/material.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/account/verification/widgets/verified_widget.dart';

class VerificationPendingWidget extends StatelessWidget {
  const VerificationPendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerifiedWidget(
      isVerified: false,
    );
  }
}
