import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showBackButton;
  final bool showNotificationIcon;
  final bool showFavoriteIcon;
  final bool showSearchIcon;
  final Widget? leading;
  final double? leadingWidth;
  final Color? bColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBackButton = false,
    this.showNotificationIcon = false,
    this.showFavoriteIcon = false,
    this.showSearchIcon = false,
    this.leading,
    this.leadingWidth, this.bColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bColor,
      elevation: 1,
      automaticallyImplyLeading: false,
      leading: showBackButton ?
      IconButton(
        icon:  Icon(CupertinoIcons.back),
        onPressed: () => Navigator.of(context).pop(),
      ) : leading,
      leadingWidth: leadingWidth,
      title:  title != null ?Text(title!):titleWidget,
      actions:  [
        if(showNotificationIcon)
        IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(),)),
          icon: Icon(Icons.notifications_active_outlined,),
        ),

        if(showFavoriteIcon)
        IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(),)),
          icon: const Icon(Icons.favorite_border),
        ),

        if(showSearchIcon)
        IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(),)),
          icon: Icon(CupertinoIcons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
