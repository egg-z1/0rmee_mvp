import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

// 사용법:
// OrmeeToast.show(context, "message");
// 이렇게 호출

class OrmeeToast {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.1, // 화면 하단 20% 위치
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xE5545454),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: B4_14px_M(
                  text: message,
                  color: OrmeeColor.white,
                ),
              )),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // 일정 시간 후 제거
    Future.delayed(Duration(seconds: 2)).then((_) => overlayEntry.remove());
  }
}
