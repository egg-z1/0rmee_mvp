import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class DropdownController extends GetxController {
  RxString selectedMonth = ''.obs;
}

class OrmeeDropDownButton extends StatelessWidget {
  final double? topPadding;
  final DropdownController dropdownController;
  final List<String> dropdownItems = [
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월'
  ];

  OrmeeDropDownButton({
    super.key,
    this.topPadding,
    required this.dropdownController,
  });

  void _showDropdownDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: topPadding ?? 0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: OrmeeColor.white,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: OrmeeColor.white,
                border: Border.all(color: OrmeeColor.gray[200]!, width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 490,
                    height: 250,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: dropdownItems.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: OrmeeColor.gray[200]!,
                          thickness: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        String item = dropdownItems[index];
                        return InkWell(
                          onTap: () {
                            dropdownController.selectedMonth.value = item;
                            print('${dropdownController.selectedMonth.value}');
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: B3_18px_M(
                              text: item,
                              color: OrmeeColor.gray[600],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDropdownDialog(context);
      },
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: OrmeeColor.gray[200]!, width: 1.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Obx(
            () => B3_18px_M(
              text: dropdownController.selectedMonth.value.isNotEmpty
                  ? dropdownController.selectedMonth.value
                  : '선택하기',
              color: dropdownController.selectedMonth.value.isNotEmpty
                  ? OrmeeColor.gray[900]
                  : OrmeeColor.gray[500],
            ),
          ),
        ),
      ),
    );
  }
}
