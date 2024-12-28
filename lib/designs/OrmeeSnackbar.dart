import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

import 'OrmeeColor.dart';

// class OrmeeSnackbar {
//   static void show(BuildContext context, String message, String icon, Color color, Color iconColor) {
//     final overlay = Overlay.of(context);
//     final overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: 75,
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   SvgPicture.asset(icon, color: iconColor),
//                   const SizedBox(width: 12),
//                   Headline1_Semibold(
//                     text: message,
//                     color: OrmeeColor.grey[90],
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//
//     overlay.insert(overlayEntry);
//
//     Future.delayed(const Duration(seconds: 2)).then((_) => overlayEntry.remove());
//   }
// }

class OrmeeSnackbar {
  static void show(BuildContext context, String message, String icon, Color color, Color iconColor) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.topCenter, // 수직 상단 중앙에 배치
        child: Padding(
          padding: const EdgeInsets.only(top: 75), // 상단 여백
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(icon, color: iconColor),
                  const SizedBox(width: 12),
                  Headline1_Semibold(
                    text: message,
                    color: OrmeeColor.grey[90],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2)).then((_) => overlayEntry.remove());
  }
}
