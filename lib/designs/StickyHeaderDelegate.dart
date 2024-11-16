import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  StickyTabBarDelegate({required this.tabBar});

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: OrmeeColor.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return false;
  }
}
