import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeProblemCard.dart';
import 'package:ormee_mvp/designs/OrmeeSnackbar.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/view_model.dart';

class QuizDetail extends StatelessWidget {
  QuizDetailController controller = Get.put(QuizDetailController());
  late final String quizId;

  QuizDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    quizId = box.read('quizId');
    controller.fetchQuizDetail(quizId);
    return Scaffold(
      backgroundColor: OrmeeColor.grey[5],
      appBar: TeacherHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(Quizcreate(isUpdate: true)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: OrmeeColor.purple[40]!),
                      ),
                      child: Headline1_Semibold(text: '수정하기', color: OrmeeColor.purple[40]),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OrmeeModal(
                            titleText: "퀴즈를 삭제하시겠어요?",
                            contentText: "삭제된 퀴즈는 복구가 불가능해요.",
                            onCancel: () => Get.back(),
                            onConfirm: () async {
                              if(await controller.deleteQuiz(quizId)) {
                                OrmeeSnackbar.show(context, '퀴즈가 삭제됐습니다.', 'assets/icons/check.svg', OrmeeColor.systemGreen[5]!, OrmeeColor.systemGreen[30]!);
                              }
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: OrmeeColor.grey[20]!),
                      ),
                      child: Headline1_Semibold(text: '삭제하기', color: OrmeeColor.grey[90]),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (controller.quiz.value?.problems == null || controller.quiz.value!.problems.isEmpty) {
                  return const Center(child: Text('문제가 없습니다.'));
                }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.quiz.value!.problems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: OrmeeProblemCard(problem: controller.quiz.value!.problems[index], currentIndex: index, totalIndex: controller.quiz.value!.problems.length),
                        );
                      }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

}