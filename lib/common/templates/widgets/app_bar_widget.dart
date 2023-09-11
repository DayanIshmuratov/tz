import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double height;
  final Icon? leadingIcon;
  const CustomAppBarWidget({super.key, required this.text, this.height = kToolbarHeight, this.leadingIcon});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leadingIcon != null ? IconButton(
        icon: leadingIcon!,
        onPressed: () {
          Navigator.pop(context);
        },
      ) : null,
      title: Text(text, style: Theme.of(context).textTheme.appBarTextStyle, maxLines: 3),
      centerTitle: true,
    );
  }
}