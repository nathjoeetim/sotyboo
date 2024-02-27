import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/player_tile.dart';

class Players extends StatelessWidget {
  const Players({
    Key? key,
    this.verticalPadding = true,
  }) : super(key: key);

  final bool verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ? 16.h : 0),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  index < 3 ? EdgeInsets.only(bottom: 8.h) : EdgeInsets.zero,
              child: PlayerTile(
                logo: 'EN',
                title: 'Haaland, Erling',
                subtitle: 'Manchester City',
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
