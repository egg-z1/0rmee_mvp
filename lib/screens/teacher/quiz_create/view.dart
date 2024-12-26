import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view_model.dart';

class Quizcreate extends StatefulWidget {
  final String lectureId;

  const Quizcreate({super.key, required this.lectureId});

  @override
  State<Quizcreate> createState() => _QuizcreateState();
}

class _QuizcreateState extends State<Quizcreate> {
  QuizCreateController quizCreateController = Get.put(QuizCreateController());

  List<Problem> problems = [];
  Quiz quiz = Quiz(
    title: "",
    description: "",
    openTime: DateTime.now(),
    dueTime: DateTime.now().add(const Duration(days: 7)),
    timeLimit: 30,
    isDraft: true,
    problems: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bar(),
              quizTitle(),
              const SizedBox(height: 32),
              quizCondition(),
              const SizedBox(height: 32),
              problemCards(),
              const SizedBox(height: 32),
              Center(child: addButton()), // 추가 버튼
            ],
          ),
        ),
      ),
    );
  }

  bar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            GestureDetector(
                onTap: Get.back,
                child: SvgPicture.asset('assets/icons/arrow_left.svg',
                    colorFilter: ColorFilter.mode(
                        OrmeeColor.gray[900]!, BlendMode.srcIn))),
            const SizedBox(width: 12),
            T1_28px(text: '퀴즈 생성', color: OrmeeColor.gray[900]),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                saveQuiz(true);
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                    color: OrmeeColor.gray[100],
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: T5_18px(text: '임시저장'),
                ),
              ),
            ),
            const SizedBox(width: 18),
            GestureDetector(
              onTap: () {
                saveQuiz(false);
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                    color: OrmeeColor.primaryPuple[400],
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: T5_18px(text: '등록하기', color: OrmeeColor.white),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  quizTitle() {
    return TextFormField(
      controller: quizCreateController.titleController,
      focusNode: quizCreateController.titleFocusNode,
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: OrmeeColor.gray[900],
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: OrmeeColor.gray[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(width: 2, color: OrmeeColor.primaryPuple[500]!),
        ),
        hintText: '퀴즈 제목을 입력하세요',
        hintStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: OrmeeColor.gray[500],
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      ),
    );
  }

  quizCondition() {
    return Row(
      children: [
        dateTimePicker(
            icon: 'assets/icons/type=calender.svg',
            label: '응시 기한',
            onChanged: (value) {
              quiz.dueTime = value;
            },
            context: context),
        const SizedBox(width: 24),
        dropDown(
          icon: 'assets/icons/type=stopwatch.svg',
          label: '응시 시간',
          items: ['10분', '15분', '20분', '25분', '30분', '35분'],
          onChanged: (value) {
            if (value != null) {
              quiz.timeLimit = int.parse(value.replaceAll('분', ''));
            }
          },
          // context: context
        ),
      ],
    );
  }

  Widget dropDown({
    required String icon,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final GlobalKey key = GlobalKey();
    var selectedValue = Rx<String?>(null);

    return GestureDetector(
        key: key,
        onTap: () async {
          final RenderBox renderBox =
              key.currentContext!.findRenderObject() as RenderBox;
          final Offset offset = renderBox.localToGlobal(Offset.zero);
          final double x = offset.dx;
          final double y = offset.dy + renderBox.size.height + 16;
          final double width = renderBox.size.width;

          await showDialog(
            context: context,
            barrierDismissible: true,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Positioned(
                    left: x,
                    top: y,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: OrmeeColor.white,
                          border: Border.all(
                              color: OrmeeColor.gray[200]!, width: 1),
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
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: items.length,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: OrmeeColor.gray[200]!,
                                  thickness: 1,
                                );
                              },
                              itemBuilder: (context, index) {
                                String item = items[index];
                                return InkWell(
                                  onTap: () {
                                    selectedValue.value = item;
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: OrmeeColor.white,
            border: Border.all(
              color: OrmeeColor.gray[200]!,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon, color: OrmeeColor.primaryPuple[400]),
              const SizedBox(width: 8),
              T5_18px(text: label, color: OrmeeColor.gray[900]),
              const SizedBox(width: 16),
              Obx(() => B2_20px_M(
                    text: selectedValue.value ?? '선택하기',
                    color: selectedValue.value == null
                        ? OrmeeColor.gray[500]
                        : OrmeeColor.gray[900],
                  )),
            ],
          ),
        ));
  }

  saveQuiz(bool isDraft) {
    quiz.isDraft = isDraft;
    for(int i = 0; i < quizCreateController.problems.length; i++) {
      quizCreateController.problems[i].content = quizCreateController.problemControllers[i].value.toString();
      // 타입 저장
      // 정답 저장
      for(int j = 0; j < quizCreateController.options[i].length; j++) {
        quizCreateController.options[i][j] = quizCreateController.optionControllers[i][j].value.toString();
      }
      quizCreateController.problems[i].items = quizCreateController.options[i];
    }

    quiz.problems = quizCreateController.problems;
    quizCreateController.createQuiz(quiz.toJson(), widget.lectureId);
  }

  Widget dateTimePicker(
      {required String icon,
      required String label,
      required ValueChanged<DateTime> onChanged,
      required BuildContext context}) {
    void showMaterialDateTimePicker() async {
      DateTime initialDate =
          quizCreateController.selectedDueTime.value ?? DateTime.now();
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: OrmeeColor.white,
                colorScheme: ColorScheme.light(
                  primary: OrmeeColor.primaryPuple[400]!,
                  onPrimary: OrmeeColor.white,
                  onSurface: OrmeeColor.gray[500]!,
                ),
                dialogBackgroundColor: OrmeeColor.white,
              ),
              child: child!,
            );
          });

      if (pickedDate != null) {
        TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(initialDate),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: OrmeeColor.white,
                  colorScheme: ColorScheme.light(
                    primary: OrmeeColor.primaryPuple[400]!,
                    onPrimary: OrmeeColor.white,
                    onSurface: OrmeeColor.gray[500]!,
                  ),
                  dialogBackgroundColor: OrmeeColor.white,
                ),
                child: child!,
              );
            });

        if (pickedTime != null) {
          quizCreateController.selectedDueTime.value = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          onChanged(quizCreateController.selectedDueTime.value!);
        }
      }
    }

    return GestureDetector(
      onTap: showMaterialDateTimePicker,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: OrmeeColor.gray[200]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, color: OrmeeColor.primaryPuple[400]),
            const SizedBox(width: 8),
            T5_18px(text: label, color: OrmeeColor.gray[900]),
            const SizedBox(width: 16),
            Obx(() => B2_20px_M(
                  text: quizCreateController.selectedDueTime.value == null
                      ? '선택하기'
                      : DateFormat('yyyy.MM.dd HH:mm')
                          .format(quizCreateController.selectedDueTime.value!),
                  color: quizCreateController.selectedDueTime.value == null
                      ? OrmeeColor.gray[500]
                      : OrmeeColor.gray[900],
                )),
          ],
        ),
      ),
    );
  }

  problemCards() {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: quizCreateController.problems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: OrmeeColor.gray[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 12),
                      T4_20px(text: '${index + 1}번'),
                      const Spacer(),
                      Row(
                        children: [
                          dropDown(
                              icon: '',
                              label: '타입',
                              items: ['객관식', '단답형'],
                              onChanged: (value) {}),
                          const SizedBox(width: 12),
                          GestureDetector(
                              onTap: () {
                                quizCreateController.removeProblem(index);
                              },
                              child: SvgPicture.asset(
                                  'assets/icons/type=trash.svg',
                                  color: OrmeeColor.gray[500])),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  problemTitle(index),
                  const SizedBox(height: 16),
                  options(index), // 단답형 디자인 참고해 problem type에 따라 변경
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 28),
                    decoration: BoxDecoration(
                      color: OrmeeColor.primaryPuple[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        T4_20px(
                            text: '정답', color: OrmeeColor.primaryPuple[400]),
                        const SizedBox(width: 28),
                        GestureDetector(
                          onTap: () {
                            // 정답 선택 모달
                          },
                          child: T4_20px(
                            text: '선택하기',
                            color: OrmeeColor.primaryPuple[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }

  addButton() {
    return GestureDetector(
      onTap: () {
        quizCreateController.addProblem();
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: OrmeeColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
              )
            ]),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/plus.svg',
            color: OrmeeColor.primaryPuple[400]!,
          ),
        ),
      ),
    );
  }

  problemTitle(int index) {
    return TextFormField(
      controller: quizCreateController.problemControllers[index],
      focusNode: quizCreateController.problemFocusNodes[index],
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: OrmeeColor.gray[900],
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: OrmeeColor.white,
        hoverColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: OrmeeColor.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(width: 2, color: OrmeeColor.primaryPuple[500]!),
        ),
        hintText: '질문을 입력하세요',
        hintStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: OrmeeColor.gray[500],
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      ),
    );
  }

  options(int problemIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: OrmeeColor.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Obx(() {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizCreateController.options[problemIndex].length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SvgPicture.asset('assets/icons/default_round.svg'),
                    const SizedBox(width: 10),
                    IntrinsicWidth(
                      child: TextField(
                        controller: quizCreateController.optionControllers[problemIndex][index],
                        focusNode: quizCreateController.optionFocusNodes[problemIndex][index],
                        decoration: InputDecoration(
                            hintText: '옵션 입력',
                            hintStyle: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: OrmeeColor.gray[900]
                            ),
                            border: InputBorder.none
                        ),
                        style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: OrmeeColor.gray[900]
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                        onTap: () {
                          quizCreateController.options[problemIndex].removeAt(index);
                          quizCreateController.optionControllers[problemIndex].removeAt(index);
                          quizCreateController.optionFocusNodes[problemIndex].removeAt(index);

                          quizCreateController.options[problemIndex] = List<String>.from(quizCreateController.options[problemIndex]);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: OrmeeColor.gray[100],
                          ),
                          child: Center(
                            child: Icon(Icons.remove, color: OrmeeColor.primaryPuple[400], size: 16),
                          ),
                        )
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20), // 간격 추가
            );
          }),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              quizCreateController.options[problemIndex].add("");
              quizCreateController.optionControllers[problemIndex].add(TextEditingController());
              quizCreateController.optionFocusNodes[problemIndex].add(FocusNode());

              quizCreateController.options[problemIndex] = List<String>.from(quizCreateController.options[problemIndex]);
            },
            child: Row(
              children: [
                Icon(Icons.add, color: OrmeeColor.primaryPuple[400]),
                const SizedBox(width: 8),
                B4_16px_M(text: '옵션 추가', color: OrmeeColor.gray[500]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
