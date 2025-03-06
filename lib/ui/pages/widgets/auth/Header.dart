import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';


class Header extends StatelessWidget {
  final String heading;
  final String? subHeading;
  const Header({
    required this.heading,
     this.subHeading,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$heading",

            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              height: 1.2,
              fontSize: 26.0

            ),

          ),

          subHeading != null?Text("$subHeading",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppPallete.greyColor,
              fontSize: 18,
              fontFamily: 'Raleway',
              height: 1.2
            ),
          ):SizedBox(),
        ],
      ),
    );
  }
}
