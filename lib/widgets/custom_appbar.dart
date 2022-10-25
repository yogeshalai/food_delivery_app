
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CURRENT LOCATION',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              'Nashik, 12 Yogi Street',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
