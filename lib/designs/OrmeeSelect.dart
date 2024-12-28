import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

// final LayerLink layerLink = LayerLink();
//     OverlayEntry? overlayEntry;
//     // select answer dialog 사용법
//     void openOrmeeSelect() {
//       overlayEntry = OverlayEntry(
//         builder: (context) => OrmeeSelect(
//           answerList: ["Apple", "Banana", "Cherry"],
//           layerLink: layerLink,
//           onSelect: (selected) {
//             print("Selected: $selected");
//             overlayEntry?.remove();
//             overlayEntry = null;
//           },
//         ),
//       );
//       Overlay.of(context).insert(overlayEntry!);
//     }

class OrmeeSelectController extends GetxController {
  var selectedIndex = Rx<int?>(null);

  void selectOption(
      int index, String option, void Function(String selected)? onSelect) {
    selectedIndex.value = index;
    onSelect?.call(option);
  }
}

class OrmeeSelect extends StatelessWidget {
  final List<String> answerList;
  final void Function(String selected)? onSelect;
  final LayerLink layerLink;

  const OrmeeSelect({
    super.key,
    required this.answerList,
    required this.layerLink,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    // final labels = ['a', 'b', 'c', 'd', 'e'];
    final controller = Get.put(OrmeeSelectController());

    return Positioned(
      child: CompositedTransformFollower(
        link: layerLink,
        offset: const Offset(100, -500),
        showWhenUnlinked: false,
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Material(
                color: OrmeeColor.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          onSelect?.call("");
                        },
                        icon: Icon(Icons.close, color: OrmeeColor.grey[40],),
                      ),
                      // const SizedBox(height: 22),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                        itemCount: answerList.length,
                        itemBuilder: (context, index) {
                          final option = answerList[index];

                          return InkWell(
                            onTap: () {
                              controller.selectOption(index, option, onSelect);
                            },
                            child: Obx(() {
                              final isSelected =
                                  controller.selectedIndex.value == index;

                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      isSelected
                                          ? "assets/icons/checked_round.svg"
                                          : "assets/icons/default_round.svg",
                                      width: 24,
                                      height: 24,
                                      color: isSelected
                                          ? OrmeeColor.primaryPuple[400]
                                          : null,
                                    ),
                                    const SizedBox(width: 10),
                                    Body_Regular(
                                      text: option,
                                      color: OrmeeColor.grey[90],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
