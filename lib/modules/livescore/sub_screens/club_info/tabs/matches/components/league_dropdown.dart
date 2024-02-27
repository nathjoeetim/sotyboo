import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/theme/colors.dart';
/*

class LeagueDropdownMenu extends StatefulWidget {
  const LeagueDropdownMenu({super.key});

  @override
  _LeagueDropdownMenuState createState() => _LeagueDropdownMenuState();
}

class _LeagueDropdownMenuState extends State<LeagueDropdownMenu> {
  Map<String, dynamic> selectedValue = {
    'icon': SvgPicture.asset('assets/svgs/global.svg'),
    'option': 'All competitions'
  };

  // Default selected value
  bool isDropdownOpen = false;

  List<Map<String, dynamic>> dropdownItems = [
    {
      'icon': SvgPicture.asset('assets/svgs/global.svg'),
      'option': 'All competitions'
    },
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Premier League'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Community Shield'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'FA Cup'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'EPL Cup'},
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 21/22'
    },
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 20/22'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group G'},
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Semi-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Quarter-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Round of 16'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group A'},
    {'icon': Image.asset('assets/svgs/world.png'), 'option': 'Club Friendlies'},
  ];

  @override
  Widget build(BuildContext context) {
    */
/* return Column(
      children: [
        DropdownButton<Map<String, dynamic>>(
          // value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          underline: Container(),
          items: dropdownItems.map((item) {
            return DropdownMenuItem<Map<String, dynamic>>(
              value: item,
              child: Row(
                children: [
                  item['icon'],
                  SizedBox(width: 8),
                  Text(item['option']),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
        Text(
          'Selected: ${selectedValue['option']}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );*/ /*

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected Tile
        ListTile(
          leading: InkWell(
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                selectedValue['icon'],
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.tertiaryBase10,
                ),
              ],
            ),
            child:
          ),
          title: Text(
            selectedValue['option'],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.tertiary9,
            ),
          ),
          //  SizedBox(width: 5),
        ),
        // Dropdown Tiles
        if (isDropdownOpen)
          Container(
            //width: double.infinity,
            //margin: const EdgeInsets.symmetric(horizontal: 16),
            constraints: BoxConstraints(
              //maxWidth: MediaQuery.of(context).size.width - 32.w,
              maxWidth: 246.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.tertiary1,
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              children: dropdownItems.map((item) {
                */
/*return InkWell(
                  onTap: () {
                    setState(() {
                      selectedValue = item;
                      isDropdownOpen = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      children: [
                        item['icon'],
                        SizedBox(width: 16.w),
                        Text(
                          item['option'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.tertiary9,
                          ),
                        ),
                      ],
                    ),
                  ),
                );*/ /*

                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedValue = item;
                      isDropdownOpen = false;
                    });
                  },
                  leading: item['icon'],
                  title: Text(
                    item['option'],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.tertiary9,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
*/

class LeagueDropdownMenu extends StatefulWidget {
  const LeagueDropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<LeagueDropdownMenu> createState() => _LeagueDropdownMenuState();
}

class _LeagueDropdownMenuState extends State<LeagueDropdownMenu> {
  //String? _selectedSex;
  late Map<String, dynamic> _selectedValue;

  late bool _isDropdownOpen;

  List<Map<String, dynamic>> dropdownItems = [
    {
      'icon': SvgPicture.asset('assets/svgs/global.svg'),
      'option': 'All competitions'
    },
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Premier League'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'Community Shield'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'FA Cup'},
    {'icon': Image.asset('assets/images/EN.png'), 'option': 'EPL Cup'},
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 21/22'
    },
    {
      'icon': Image.asset('assets/images/EN.png'),
      'option': 'Premier League 20/22'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group G'},
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Semi-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Quarter-Finals'
    },
    {
      'icon': Image.asset('assets/images/fancy_ball.png'),
      'option': 'Round of 16'
    },
    {'icon': Image.asset('assets/images/fancy_ball.png'), 'option': 'Group A'},
    {'icon': Image.asset('assets/svgs/world.png'), 'option': 'Club Friendlies'},
  ];

  List<DropdownMenuItem<Map<String, dynamic>>> _addDividersAfterItems(
      List<Map<String, dynamic>> items) {
    List<DropdownMenuItem<Map<String, dynamic>>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<Map<String, dynamic>>(
            value: item,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Row(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 28.w,
                    child: item['icon'],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      item['option'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.tertiary9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownMenuItem<Map<String, dynamic>>(
              enabled: false,
              child: Divider(
                thickness: 1.h,
                color: AppColors.tertiary3,
              ),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (dropdownItems.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(44.h);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4.h);
      }
    }
    return _itemsHeights;
  }

  @override
  void initState() {
    super.initState();

    // _selectedSex = widget.list[0];

    _selectedValue = dropdownItems[0];

    _isDropdownOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: null,
            items: _addDividersAfterItems(dropdownItems),
            value: _selectedValue,
            onMenuStateChange: (opened) {
              _isDropdownOpen = opened;
            },
            onChanged: (value) {
              setState(() {
                _selectedValue = value as Map<String, dynamic>;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return dropdownItems.map((item) {
                return Container(
                  color: AppColors.tertiary2,
                  //height: 48.h,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: _selectedValue['icon'],
                            ),
                            //_selectedValue['icon'],
                            Icon(
                              _isDropdownOpen
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: AppColors.tertiaryBase10,
                            ),
                          ],
                        ),
                        SizedBox(width: 11.33.w),
                        Text(
                          _selectedValue['option'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.tertiary9,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList();
            },
            buttonStyleData: ButtonStyleData(
              height: 48.h,
              width: MediaQuery.of(context).size.width,
              /*padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),*/
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(5.r),
                /*border: Border.all(
                  color: AppColors.borderAsh,
                  width: 1.r,
                ),*/
                color: AppColors.tertiary2,
              ),
              elevation: 0,
            ),
            iconStyleData: const IconStyleData(
              icon: SizedBox.shrink(),
              iconSize: 0,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: null,
                width: 246.w,
                /*padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 12.w,
                                ),*/
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  color: AppColors.tertiary1,
                ),
                elevation: 0,
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40.r),
                  thickness: MaterialStateProperty.all(6.w),
                  thumbVisibility: MaterialStateProperty.all(true),
                )),
            menuItemStyleData: MenuItemStyleData(
              //height: 35.h,
              customHeights: _getCustomItemsHeights(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
      ],
    );
  }
}
