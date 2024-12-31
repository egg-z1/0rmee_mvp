import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/memo/model.dart';
import 'package:ormee_mvp/screens/teacher/memo/view_model.dart';

class TeacherMemoList extends StatelessWidget {
  final TeacherMemoController controller = Get.put(TeacherMemoController());
  final TeacherMessageStatisticsController controller1 =
      Get.put(TeacherMessageStatisticsController());
  String? lectureId;
  TeacherMemoList({super.key});
  final RxBool isComplete = true.obs;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    lectureId = box.read('lectureId');
    controller.fetchTeacherMemos(lectureId!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        header(context),
        SizedBox(height: 20),
        Obx(
          () => Expanded(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading1_Semibold(text: '진행 쪽지'),
                SizedBox(height: 20),
                controller.openMemos.isNotEmpty
                    ? ING_memoCard(context)
                    : NULL_memoCard('현재 진행 중인 쪽지가 없어요.'),
                SizedBox(height: 30),
                Heading1_Semibold(text: '마감 쪽지'),
                SizedBox(height: 20),
                controller.closeMemos.isNotEmpty
                    ? END_memoCard()
                    : NULL_memoCard('현재 마감한 쪽지가 없어요.'),
              ],
            )),
          ),
        ),
      ],
    );
  }

  header(context) {
    final TextFieldController titleController = TextFieldController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return OrmeeDialog(
                  titleText: '쪽지 생성',
                  contentText: '쪽지 제목',
                  titleController: titleController,
                  buttonText: '생성하기',
                  onCancel: () {
                    titleController.textEditingController.clear();
                    titleController.isTextNotEmpty = false.obs;
                    titleController.textLength = 0.obs;
                    Get.back();
                  },
                  onConfirm: () {
                    controller.fetchTeacherCreateMemo(
                        lectureId!,
                        MemoCreateModel(
                            title: titleController.textEditingController.text));
                    titleController.textEditingController.clear();
                    titleController.isTextNotEmpty = false.obs;
                    titleController.textLength = 0.obs;
                    Get.forceAppUpdate();
                    Get.back();
                  },
                  haveDropdown: false,
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: OrmeeColor.purple[40]!.withOpacity(0.4),
                  offset: Offset(2, 4),
                  blurRadius: 12.5,
                ),
              ],
              color: OrmeeColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/plus.svg',
                  color: OrmeeColor.purple[40],
                ),
                SizedBox(width: 10),
                Headline1_Bold(
                  text: '쪽지 생성',
                  color: OrmeeColor.purple[40],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget NULL_memoCard(text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 78),
      child: Center(
          child: Heading2_Semibold(
        text: text,
        color: OrmeeColor.grey[30],
      )),
    );
  }

  Widget ING_memoCard(context) {
    return Column(
      children: List.generate(controller.openMemos.length, (index) {
        return Padding(
          padding: index == controller.openMemos.length - 1
              ? EdgeInsets.zero
              : EdgeInsets.only(bottom: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: OrmeeColor.grey[10]!, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 9),
                        decoration: BoxDecoration(
                          color: OrmeeColor.purple[3],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/ing_memo.svg',
                          color: OrmeeColor.purple[40],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Headline1_Semibold(
                                overflow: TextOverflow.ellipsis,
                                text: controller.openMemos[index].title),
                            SizedBox(height: 5),
                            Label1(
                              text: '${controller.openMemos[index].dueTime}',
                              color: OrmeeColor.grey[30],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OrmeeModal(
                          titleText: '쪽지를 마감하시겠어요?',
                          contentText: '쪽지를 마감하면 더 이상 응답을 받을 수 없어요.',
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            controller.fetchTeacherMemoClose(
                                '0a962d36-470f-47f4-8224-68f5200547a6',
                                controller.openMemos[index].id);
                            Get.forceAppUpdate();
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: OrmeeColor.purple[40]!,
                          width: 1,
                        ),
                        color: OrmeeColor.white),
                    child: Headline2_Semibold(
                      text: '마감하기',
                      color: OrmeeColor.purple[40],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget END_memoCard() {
    RxList<bool> isClick =
        List<bool>.filled(controller.closeMemos.length, true).obs;
    return Obx(
      () => Column(
        children: List.generate(controller.closeMemos.length, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (index < isClick.length) {
                    if (isClick[index] == false) {
                      isClick.value =
                          List<bool>.filled(controller.closeMemos.length, true);
                    } else {
                      var newList =
                          List<bool>.filled(controller.closeMemos.length, true);
                      newList[index] = false;
                      isClick.value = newList;
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isClick[index]
                            ? OrmeeColor.grey[10]!
                            : OrmeeColor.purple[40]!,
                        width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Headline1_Semibold(
                              overflow: TextOverflow.ellipsis,
                              text: controller.closeMemos[index].title,
                              color: isClick[index]
                                  ? OrmeeColor.grey[40]
                                  : OrmeeColor.grey[90],
                            ),
                            SizedBox(height: 5),
                            Label1(
                              text: '${controller.closeMemos[index].dueTime}',
                              color: OrmeeColor.grey[30],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 29),
                          SvgPicture.asset(
                            'assets/icons/users.svg',
                            color: OrmeeColor.grey[30],
                          ),
                          SizedBox(width: 5),
                          Headline1_Semibold(
                            text: '${controller.closeMemos[index].submitCount}',
                            color: isClick[index]
                                ? OrmeeColor.grey[40]
                                : OrmeeColor.grey[60],
                          ),
                          // Headline1_Regular(
                          //   text: ' / 32',
                          //   color: OrmeeColor.grey[30],
                          // ),
                          SizedBox(width: 29),
                          isClick[index]
                              ? SvgPicture.asset(
                                  'assets/icons/bottom-m.svg',
                                  color: OrmeeColor.purple[40],
                                )
                              : SvgPicture.asset(
                                  'assets/icons/top-m.svg',
                                  color: OrmeeColor.purple[40],
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              isClick[index] ? Container() : SizedBox(height: 10),
              isClick[index]
                  ? Container()
                  : Statistic_memoCard(controller.closeMemos[index].id),
              SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget Statistic_memoCard(int memoId) {
    controller1.fetchMessageStatistics(memoId);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: OrmeeColor.grey[5],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 74,
                child: Center(
                  child: Label1(
                    text: '순위',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '문항',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '응답 비율',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '응답 인원',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(controller1.statistics.length, (index) {
              return Container(
                padding: index == controller1.statistics.length - 1
                    ? EdgeInsets.zero
                    : EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 74,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '${controller1.statistics[index].rank}',
                          color: OrmeeColor.grey[50],
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text:
                              '문항 ${controller1.statistics[index].contentDetail}',
                          color: OrmeeColor.grey[90],
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '${controller1.statistics[index].submitRate}%',
                          color: OrmeeColor.grey[60],
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '${controller1.statistics[index].submit}',
                          color: OrmeeColor.grey[60],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
