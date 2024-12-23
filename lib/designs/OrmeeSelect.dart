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
    final labels = ['a', 'b', 'c', 'd', 'e'];
    final controller = Get.put(OrmeeSelectController());

    return Positioned(
      width: 377,
      child: CompositedTransformFollower(
        link: layerLink,
        offset: const Offset(200, -200),
        showWhenUnlinked: false,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 24,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            color: OrmeeColor.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      T4_20px(
                        text: '정답인 옵션을 선택해주세요.',
                        color: OrmeeColor.primaryPuple[400],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          onSelect?.call(controller.selectedIndex.string);
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/type=x.svg",
                          color: OrmeeColor.gray[500],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
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
                                const SizedBox(width: 12),
                                B3_18px_M(
                                  text: "${labels[index]}. $option",
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
    );
  }
}
