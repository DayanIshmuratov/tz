import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double height;
  const AppBarWidget({super.key, required this.text, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: Text(text, style: Theme.of(context).textTheme.appBarTextStyle,),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,

    );
  }
}