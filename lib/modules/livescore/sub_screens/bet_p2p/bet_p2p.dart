import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors.dart';

class P2PBetting extends StatefulWidget {
  const P2PBetting({super.key});

  @override
  State<P2PBetting> createState() => _P2PBettingState();
}

class _P2PBettingState extends State<P2PBetting> with TickerProviderStateMixin {
  int index = 0;
  late TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiary1,
      appBar: AppBar(
        backgroundColor: AppColors.tertiary1,
        title: const Text(
          'P2P Betting',
          style: TextStyle(color: AppColors.tertiary11),
        ),
        actions: const [],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TabBar(
                  isScrollable: true,
                  controller: _controller,
                  indicatorColor: AppColors.primaryBase6,
                  labelStyle:
                      TextStyle(fontSize: 16.sp, color: AppColors.primaryBase6),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: AppColors.primaryBase6,
                  unselectedLabelColor: AppColors.tertiary8,
                  onTap: (int i) {
                    setState(() {
                      index = i;
                    });
                    // print(index);
                  },
                  tabs: const [
                    Text(
                      'Evens',
                    ),
                    Text(
                      'Odds',
                    ),
                    Text(
                      'Combo',
                    ),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: TabBarView(controller: _controller, children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        const EvensCard(),
                      ],
                    ),
                    const Text('hi'),
                    const Text('hi'),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EvensCard extends StatelessWidget {
  const EvensCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _decoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.h,
            ),
            const ListTile(
                leading: CircleAvatar(),
                title: Text(
                  'Jakepunter',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.tertiary11),
                ),
                trailing: StatusCard(children: [
                  Text(
                    'Open',
                    style: TextStyle(color: AppColors.success4),
                  )
                ])),
            const Divider(),
            const ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'England',
                    style: TextStyle(color: AppColors.tertiary11),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColors.tertiary8,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Premier League',
                    style: TextStyle(color: AppColors.tertiary11),
                  ),
                ],
              ),
            ),
            const ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Manchester Utd',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 5),
                  Text('VS'),
                  SizedBox(width: 5),
                  Text(
                    'Manchester City',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              trailing: Text(
                '1 : 1',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OldCont(),
                  OldCont(),
                  OldCont(),
                ],
              ),
            ),
            Gap(10.h),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    '13:00',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(radius: 3, backgroundColor: AppColors.tertiary8),
                  SizedBox(width: 5),
                  Text(
                    '16 markets',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Text(
                'Bet Limit',
                style: TextStyle(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '20,000',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                  const Gap(10),
                  Text(
                    'NGN',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Text(
                'Bet Amount',
                style: TextStyle(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'N20,000 -  N200000',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.tertiary2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PLACED BET: ',
                      style: TextStyle(
                          color: AppColors.tertiary8,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '155',
                      style: TextStyle(
                          color: AppColors.primaryBase6,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              trailing: SizedBox(
                  width: 140,
                  child: DefaultBtn(text: 'Place Bet', press: () {})),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ));
  }

  BoxDecoration _decoration() => BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.tertiary1,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEFEFEF),
              spreadRadius: 5,
              offset: Offset(1, 2),
              blurRadius: 10,
            ),
          ]);
}

class DefaultBtn extends StatelessWidget {
  const DefaultBtn(
      {super.key,
      required this.text,
      required this.press,
      this.color = const Color(0xff196719)});

  final String text;
  final Function() press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard(
      {super.key, required this.children, this.color = AppColors.success1});

  final List<Widget> children;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}

class OldCont extends StatelessWidget {
  const OldCont({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.tertiary3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '1',
            style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.tertiary6,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 10,
            decoration: BoxDecoration(
                border: Border.all(
              color: AppColors.tertiary4,
            )),
          ),
          Text(
            '2.27',
            style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.tertiary6,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
