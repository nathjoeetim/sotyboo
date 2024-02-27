import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportboo_mobile_client/modules/profile/widgets/custom_scaffold.dart';
import 'package:sportboo_mobile_client/core/theme/colors.dart';
import 'package:sportboo_mobile_client/unils/utils.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'About Us',
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.tertiary0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const IconBox(),
                SizedBox(height: 8.h),
                AboutUsTiles(),
                CheckForUpdatesButton(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ));
  }
}

class IconBox extends StatelessWidget {
  const IconBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      color: AppColors.tertiary1,
      child: Column(
        children: [
          Image.asset(
            getImage('logo-icon-main'),
            height: 96.h,
            width: 96.w,
          ),
          SizedBox(height: 24.h),
          // Version Number
          Text(
            'v 1.0.1',
            style: TextStyle(
              color: AppColors.tertiary6,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsTiles extends StatelessWidget {
  const AboutUsTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutUsTile(
          text: 'Like us on Facebook',
          icon: 'facebook-filled',
          onPressed: () {
            ////////
          },
        ),
        AboutUsTile(
          text: 'Follow us on Twitter',
          icon: 'twitter-fill',
          onPressed: () {
            ////////
          },
        ),
        AboutUsTile(
          text: 'Join us on Telegram',
          icon: 'telegram',
          onPressed: () {
            ////////
          },
        ),
        AboutUsTile(
          text: 'Follow us on Instagram',
          icon: 'instagram',
          onPressed: () {
            ////////
          },
        ),
        const DeviceIdTile(),
      ],
    );
  }
}

class AboutUsTile extends StatelessWidget {
  const AboutUsTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.h),
        margin: EdgeInsets.only(bottom: 2.h),
        decoration: const BoxDecoration(
          color: AppColors.tertiary1,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              getSvg(icon),
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(width: 16.w),
            Text(
              text,
              textScaleFactor: 1,
              style: TextStyle(
                color: AppColors.tertiaryBase10,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              getSvg('arrow-right'),
              height: 20.h,
              width: 20.w,
              color: AppColors.tertiary8,
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceIdTile extends StatelessWidget {
  const DeviceIdTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: const BoxDecoration(
        color: AppColors.tertiary1,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            getSvg('mobile-phone'),
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DeviceID',
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.tertiaryBase10,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '243e764561898f1a880908o753a',
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.tertiary6,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            getSvg('copy'),
            height: 20.h,
            width: 20.w,
            color: AppColors.tertiaryBase10,
          ),
        ],
      ),
    );
  }
}

class CheckForUpdatesButton extends StatelessWidget {
  const CheckForUpdatesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /////////////////////
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.tertiary1,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiaryBase10.withOpacity(0.08),
              blurRadius: 16.r,
              offset: Offset(0, 4.w),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary2,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Image.asset(
                getImage('download'),
                height: 34.29,
                width: 34.29,
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check for update',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors.tertiaryBase10,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.w),
                Text(
                  'Your current version is out of date',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors.tertiary6,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
