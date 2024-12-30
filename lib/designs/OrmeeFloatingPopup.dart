import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeFloatingPopup extends StatelessWidget {
  final String message;
  final Duration duration;
  final VoidCallback? onDismiss;

  const OrmeeFloatingPopup({
    Key? key,
    required this.message,
    this.duration = const Duration(seconds: 0),
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/triangle.svg',
            color: OrmeeColor.primaryPuple[400],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: OrmeeColor.primaryPuple[400],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                T4_16px(
                  text: message,
                  color: OrmeeColor.white,
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: onDismiss,
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: OrmeeColor.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrmeeFloatingPopupOverlay extends StatelessWidget {
  final Widget child;
  final String message;
  final bool isVisible;
  final VoidCallback onDismiss;
  final double top;
  final double right;

  const OrmeeFloatingPopupOverlay({
    Key? key,
    required this.child,
    required this.message,
    required this.isVisible,
    required this.onDismiss,
    this.top = 48 + 53,
    this.right = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isVisible)
          Positioned(
            top: top,
            right: right,
            child: OrmeeFloatingPopup(
              message: message,
              onDismiss: onDismiss,
            ),
          ),
      ],
    );
  }
}

class OrmeeFloatingPopupOverlay2 extends StatelessWidget {
  final Widget child;
  final String message;
  final bool isVisible;
  final VoidCallback onDismiss;
  final double top;
  final double left;

  const OrmeeFloatingPopupOverlay2({
    Key? key,
    required this.child,
    required this.message,
    required this.isVisible,
    required this.onDismiss,
    this.top = 212,
    this.left = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isVisible)
          Positioned(
            top: top,
            left: left,
            child: OrmeeFloatingPopup(
              message: message,
              onDismiss: onDismiss,
            ),
          ),
      ],
    );
  }
}
