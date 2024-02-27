import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/components/event_tile.dart';
import 'package:sportboo_mobile_client/modules/livescore/sub_screens/league_match_review/tabs/summary/model/event.dart';

import '../../../../../../../core/theme/colors.dart';


class EventSummary extends StatelessWidget {
  const EventSummary({
    Key? key,
    required this.events,
  }) : super(key: key);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.tertiary1,
        border: Border.all(color: AppColors.tertiary3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ...List.generate(
            events.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  border: index < events.length - 1
                      ? Border(
                          bottom: BorderSide(
                            width: 1.h,
                            color: AppColors.tertiary3,
                          ),
                        )
                      : const Border(),
                ),
                child: EventTile(
                  event: events[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
