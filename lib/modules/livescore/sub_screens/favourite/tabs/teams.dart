import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/any_tile.dart';

class Teams extends StatelessWidget {
  const Teams({
    Key? key,
    this.verticalPadding = true,
  }) : super(key: key);

  final bool verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ? 16.h : 0,
        horizontal: 16.w,
      ),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  index < 3 ? EdgeInsets.only(bottom: 8.h) : EdgeInsets.zero,
              child: AnyTile(
                logo: 'EN',
                title: 'Liverpool',
                subtitle: 'England',
                //isFavourite: isFavourite,
                onPressed: () {},
                onFavouritePressed: () {
                  /*  setState(() {
                    isFavourite = !isFavourite;
                  });*/
                },
              ),
            );
          }),
    );
  }
}
