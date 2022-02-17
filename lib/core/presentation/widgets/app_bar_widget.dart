import 'package:flutter/material.dart';
import '../../common/constants/size_constants.dart';

class KiliaroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KiliaroAppBar({Key? key, this.onRefresh, this.title}) : super(key: key);
  final String? title;
  final Function? onRefresh;
  @override
  Widget build(BuildContext context) => AppBar(
        title: (title == null)
            ? null
            : Text(title!, style: Theme.of(context).textTheme.headline6),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          if (onRefresh != null)
            IconButton(
                onPressed: () => onRefresh!(),
                icon: Icon(
                  Icons.refresh,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ))
        ],
      );

  @override
  Size get preferredSize => const Size(double.infinity, Sizes.dimen_64);
}
