import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeSelectController extends GetxController {
  final RxList<int?> selectedIndices = RxList<int?>();

  void selectOption(int problemIndex, int optionIndex, String option,
      void Function(String selected)? onSelect) {
    if (selectedIndices.length <= problemIndex) {
      selectedIndices
          .addAll(List.filled(problemIndex - selectedIndices.length + 1, null));
    }
    selectedIndices[problemIndex] = optionIndex;
    onSelect?.call(option);
  }
}

class OrmeeSelect extends StatefulWidget {
  final List<String> answerList;
  final void Function(String selected)? onSelect;
  final int problemIndex;

  const OrmeeSelect({
    Key? key,
    required this.answerList,
    this.onSelect,
    required this.problemIndex,
  }) : super(key: key);

  @override
  State<OrmeeSelect> createState() => _OrmeeSelectState();
}

class _OrmeeSelectState extends State<OrmeeSelect> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrmeeSelectController());

    return Container(
      constraints: BoxConstraints(
        maxWidth: 600,
        maxHeight: 400,
      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.onSelect?.call("");
                    },
                    icon: Icon(
                      Icons.close,
                      color: OrmeeColor.grey[40],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: widget.answerList.length,
                  itemBuilder: (context, index) {
                    final option = widget.answerList[index];

                    return InkWell(
                      onTap: () {
                        controller.selectOption(widget.problemIndex, index,
                            option, widget.onSelect);
                      },
                      child: Obx(() {
                        final isSelected = controller.selectedIndices.length >
                                widget.problemIndex &&
                            controller.selectedIndices[widget.problemIndex] ==
                                index;

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
