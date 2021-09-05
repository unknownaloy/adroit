import 'dart:math';

import 'package:flutter/material.dart';

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;
  final bool isCard;
  final Color? cardColor;
  final Color? containerColor;
  final double cardBottomLeftRadius;
  final double cardBottomRightRadius;

  CustomPersistentHeader(
      {required this.child,
      this.maxHeight = 56.0,
      this.minHeight = 56.0,
      this.isCard = false,
      this.cardColor,
      this.containerColor,
      this.cardBottomLeftRadius = 5.0,
      this.cardBottomRightRadius = 5.0});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (isCard) {
      return Container(
        height: kToolbarHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor ?? Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(cardBottomLeftRadius),
            bottomRight: Radius.circular(cardBottomRightRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: child,
      );
    } else {
      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: containerColor ?? Color(0xff79789b),
          ),
          child: child,
        ),
      );
    }
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
