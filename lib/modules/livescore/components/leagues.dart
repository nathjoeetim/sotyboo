import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/colors.dart';
import '../../../unils/utils.dart';

class Leagues extends StatefulWidget {
  const Leagues({super.key, this.showPlacedBet = true});
  final bool showPlacedBet;

  @override
  State<Leagues> createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          backgroundColor: AppColors.tertiary0,
          onExpansionChanged: (value) => setState(() => isOpen = value),
          title: Text(
            'Premier League',
            style: getTextTheme(context).bodyText2!.copyWith(
              color: AppColors.tertiary9,
            ),
          ),
          subtitle: Text(
            'England',
            style: getTextTheme(context).caption!.copyWith(
              color: AppColors.tertiary7,
            ),
          ),
          leading: Image.asset('assets/images/EN.png'),
          trailing: Icon(
            isOpen
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_right_rounded,
            size: 28,
            color: AppColors.primaryBase6,
          ),
          children: [_themePlaying(), _themePlaying()],
        ),
      ],
    );
  }

  Widget _themePlaying() => Container(
    decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.tertiary3))),
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 8.h,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('15:30'),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _club(),
                  _club(),
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            SvgPicture.asset('assets/svgs/star_empty.svg')
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        if (widget.showPlacedBet)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.tertiary2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Placed Be: 12'),
          ),
        SizedBox(
          height: 10.h,
        ),
      ],
    ),
  );

  Widget _club() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.tertiary8,
          radius: 12,
          child: CircleAvatar(
            backgroundColor: AppColors.tertiaryTint3,
            radius: 11,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        const Text(
          'Manchester City',
        ),
        const Spacer(),

        SizedBox(
          width: 10.w,
        ),
      ],
    ),
  );
}
