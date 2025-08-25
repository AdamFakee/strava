import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/const/sizes.dart';

/// class custom app bar that can reuse
class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({
    super.key, 
    this.title, 
    required this.showBackButton, 
    this.actions, 
    this.padding = const EdgeInsetsGeometry.only(right: SSizes.defaultSpace)
  });

  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: SSizes.defaultSpace * 0.8),
      child: AppBar(
        titleSpacing: 0,
        leading: showBackButton ? IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ) : null,
        automaticallyImplyLeading: false,
        title: title != null ? Text(title!, style: Theme.of(context).textTheme.headlineMedium) : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, SSizes.appBarHeight);
}
