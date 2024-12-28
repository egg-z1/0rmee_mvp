import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSnackbar.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view_model.dart';

import '../../../designs/OrmeeSelect.dart';

class Quizcreate extends StatefulWidget {
  final String? lectureId;
  final String? quizId;
  final bool isUpdate;

  const Quizcreate({super.key, this.lectureId, this.quizId, required this.isUpdate});

  @override
  State<Quizcreate> createState() => _QuizcreateState();
}

class _QuizcreateState extends State<Quizcreate> {
  QuizCreateController quizCreateController = Get.put(QuizCreateController());

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
  void initState() {
    super.initState();
    if(widget.isUpdate) {
      quizCreateController.getDraftQuiz(widget.quizId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeacherHeader(),
      backgroundColor: OrmeeColor.grey[5],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(370, 0, 80, 0),
          child: Column(
            children: [
              bar(),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: OrmeeColor.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    quizTitle(),
                    const SizedBox(height: 12),
                    quizCondition()
                  ],
                ),
              ),
              const SizedBox(height: 20),
              problemCards(),
              const SizedBox(height: 20),
              Center(child: addButton()),
              const SizedBox(height: 48)
            ],
          ),
        ),
      ),
    );
  }

  bar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              saveQuiz(true);
              Get.back();
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: OrmeeColor.grey[20]!),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Headline1_Semibold(
                  text: '임시저장', color: OrmeeColor.grey[90],),
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
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  color: OrmeeColor.purple[40],
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Headline1_Semibold(text: '등록하기', color: OrmeeColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  quizTitle() {
    return TextFormField(
      controller: quizCreateController.titleController,
      focusNode: quizCreateController.titleFocusNode,
      keyboardType: TextInputType.multiline,
      style: TextStyle(
          fontFamily: 'Pretendard',
          color: OrmeeColor.grey[90],
          fontSize: 22,
          fontWeight: FontWeight.w600
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '퀴즈 제목을 입력하세요',
        hintStyle: TextStyle(
            fontFamily: 'Pretendard',
            color: OrmeeColor.grey[30],
            fontSize: 22,
            fontWeight: FontWeight.w600
        ),
        counterText: "",
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }

  quizCondition() {
    return Row(
      children: [
        dateTimePicker(
            icon: 'assets/icons/Property 1=calender, size=l.svg',
            label: '응시기한',
            onChanged: (value) {
              quiz.dueTime = value;
            },
            context: context),
        const SizedBox(width: 16),
        dropDown(
          icon: 'assets/icons/Property 1=timer, size=l.svg',
          label: '응시시간',
          items: ['10분', '20분', '30분', '40분', '50분', '60분'],
          onChanged: (value) {
            if (value != null) {
              quiz.timeLimit = int.parse(value.replaceAll('분', ''));
            }
          },
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
                          borderRadius: BorderRadius.circular(5),
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
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                String item = items[index];
                                return InkWell(
                                  onTap: () {
                                    quizCreateController.selectedTimeLimit(item);
                                    onChanged(item);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Headline2_Regular(
                                      text: item,
                                      color: OrmeeColor.grey[90],
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: OrmeeColor.grey[5],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon, color: OrmeeColor.purple[40]),
              const SizedBox(width: 12),

              Obx(() =>
                  Heading2_Semibold(
                    text: quizCreateController.selectedTimeLimit.value ?? label,
                    color: quizCreateController.selectedTimeLimit.value == null
                        ? OrmeeColor.grey[40]
                        : OrmeeColor.grey[90],
                  )),
            ],
          ),
        ));
  }

  saveQuiz(bool isDraft) {
    if (quizCreateController.titleController.text.isEmpty) {
      OrmeeSnackbar.show(context, "제목은 필수입니다.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);
      return;
    }
    quiz.isDraft = isDraft;
    quiz.title = quizCreateController.titleController.text;

    for (int i = 0; i < quizCreateController.problems.length; i++) {
      if (!isDraft && quizCreateController.problemControllers[i].text.isEmpty) {
        OrmeeSnackbar.show(context, "문제 ${i + 1}의 내용이 비어 있습니다.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);

        return;
      }
      quizCreateController.problems[i].content =
          quizCreateController.problemControllers[i].text;

      if (!isDraft && quizCreateController.types[i] == null) {
        OrmeeSnackbar.show(context, "문제 ${i + 1}의 유형이 설정되지 않았습니다.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);


        return;
      }
      quizCreateController.problems[i].type = quizCreateController.types[i];

      if (!isDraft && (quizCreateController.answers[i] == null ||
          quizCreateController.answers[i].isEmpty)) {
        OrmeeSnackbar.show(context, "문제 ${i + 1}의 정답이 설정되지 않았습니다.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);

        return;
      }
      quizCreateController.problems[i].answer = quizCreateController.answers[i];

      if (quizCreateController.problems[i].type == 'CHOICE') {
        for (int j = 0; j < quizCreateController.options[i].length; j++) {
          String optionText = quizCreateController.optionControllers[i][j].text;
          if (!isDraft && optionText.isEmpty) {
            OrmeeSnackbar.show(context, "문제 ${i + 1}의 선지 ${j + 1}이 비어 있습니다.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);

            return;
          }
          quizCreateController.options[i][j] = optionText;
        }
      }
      quizCreateController.problems[i].items = quizCreateController.options[i];
    }

    quiz.problems = quizCreateController.problems;

    if(widget.isUpdate) {
      quizCreateController.updateQuiz(quiz.toJson(), widget.quizId!);
    } else {
      quizCreateController.createQuiz(quiz.toJson(), widget.lectureId!);
    }
  }

  Widget dateTimePicker({required String icon,
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
                  primary: OrmeeColor.purple[40]!,
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
                    primary: OrmeeColor.purple[40]!,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: OrmeeColor.grey[5],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, color: OrmeeColor.purple[40]),
            const SizedBox(width: 12),
            Obx(() =>
                Heading2_Semibold(
                  text: quizCreateController.selectedDueTime.value == null
                      ? label
                      : DateFormat('yy.MM.dd HH:mm')
                      .format(quizCreateController.selectedDueTime.value!),
                  color: quizCreateController.selectedDueTime.value == null
                      ? OrmeeColor.grey[40]
                      : OrmeeColor.grey[90],
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
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: OrmeeColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 12),
                      Title3_Semibold(
                          text: '${index + 1}', color: OrmeeColor.grey[90]),
                      const Spacer(),
                      selectProblemType(
                          icon: 'assets/icons/Property 1=bottom, size=m.svg',
                          index: index,
                          items: ['객관식', '단답형'],
                          onChanged: (value) {
                            quizCreateController.types[index] = (value == '객관식')
                                ? 'CHOICE'
                                : 'ESSAY';
                          })
                    ],
                  ),
                  const SizedBox(height: 16),
                  problemTitle(index),
                  const SizedBox(height: 16),
                  Obx(() =>
                  quizCreateController.types[index] == "CHOICE"
                      ? options(index)
                      : const SizedBox()),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: OrmeeColor.purple[5],
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Headline1_Semibold(
                                text: '정답', color: OrmeeColor.purple[40]),
                          ),
                          const SizedBox(width: 16),
                          Obx(() =>
                          (quizCreateController.types[index] == 'CHOICE') ?
                          GestureDetector(
                            onTap: () {
                              openOrmeeSelect(index);
                              },
                            child: CompositedTransformTarget(
                              link: quizCreateController.layerLinks[index],
                              child: (quizCreateController.answers[index] == "") ? Headline1_Semibold(
                                text: '선택',
                                color: OrmeeColor.grey[30],
                              ) : Heading2_Semibold(text: quizCreateController.answers[index], color: OrmeeColor.purple[40],),
                            ),
                          )
                              : inputAnswer(index))
                        ],
                      ),
                      Obx(() =>
                      quizCreateController.problems.length > 1
                          ? GestureDetector(
                          onTap: () {
                            quizCreateController.removeProblem(index);
                          },
                          child: SvgPicture.asset(
                              'assets/icons/Property 1=trash, size=l.svg',
                              color: OrmeeColor.grey[50])
                      )
                          : const SizedBox())
                    ],
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
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: OrmeeColor.white,
        ),
        child: Center(
          child: Icon(Icons.add, color: OrmeeColor.purple[40]!, size: 36),
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
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: OrmeeColor.grey[20]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          BorderSide(width: 1, color: OrmeeColor.primaryPuple[500]!),
        ),
        hintText: '질문을 입력하세요',
        hintStyle: TextStyle(
            color: OrmeeColor.grey[30],
            fontFamily: 'Pretendard',
            fontSize: 18,
            fontWeight: FontWeight.w400
        ),
        contentPadding:
        const EdgeInsets.all(20),
      ),
    );
  }

  options(int problemIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: OrmeeColor.grey[5], borderRadius: BorderRadius.circular(10)),
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
                        controller: quizCreateController
                            .optionControllers[problemIndex][index],
                        focusNode: quizCreateController
                            .optionFocusNodes[problemIndex][index],
                        maxLength: 50,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: '선지입력',
                            hintStyle: TextStyle(
                                color: OrmeeColor.grey[90],
                                fontFamily: 'Pretendard',
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                            counterText: '',
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
                    Obx(() =>
                    (quizCreateController.options[problemIndex].length > 1) ?
                    GestureDetector(
                        onTap: () {
                          quizCreateController.removeOption(
                              problemIndex, index);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: OrmeeColor.gray[5],
                          ),
                          child: Center(
                            child: Icon(Icons.close, color: OrmeeColor.grey[60],
                                size: 14),
                          ),
                        )
                    )
                        : const SizedBox())
                  ],
                );
              },
              separatorBuilder: (context, index) =>
              const SizedBox(height: 12),
            );
          }),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              quizCreateController.addOption(problemIndex);
            },
            child: Row(
              children: [
                const SizedBox(width: 4),
                Icon(Icons.add, color: OrmeeColor.primaryPuple[400]),
                const SizedBox(width: 8),
                Body_Regular(text: '선지 추가', color: OrmeeColor.grey[40]),
              ],
            ),
          )
        ],
      ),
    );
  }

  selectProblemType({
    required String icon,
    required int index,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final GlobalKey key = GlobalKey();
    var selectedValue = Rx<String?>(
        (quizCreateController.types[index] == 'CHOICE') ? "객관식" : "단답형");

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
                          borderRadius: BorderRadius.circular(5),
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
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                String item = items[index];
                                return InkWell(
                                  onTap: () {
                                    selectedValue.value = item;
                                    onChanged(item);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Headline2_Regular(
                                      text: item,
                                      color: OrmeeColor.grey[90],
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              color: OrmeeColor.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: OrmeeColor.grey[30]!
              )
          ),
          child: Row(
            children: [
              Obx(() =>
                  Headline2_Semibold(
                    text: selectedValue.value!,
                    color: OrmeeColor.grey[90],
                  )),
              const SizedBox(width: 36),
              SvgPicture.asset(icon, color: OrmeeColor.grey[30])
            ],
          ),
        ));
  }

  inputAnswer(int index) {
    final TextEditingController controller = TextEditingController(text: quizCreateController.answers[index]);
    return IntrinsicWidth(
      child: TextField(
        controller: controller,
        maxLength: 50,
        decoration: InputDecoration(
            hintText: '입력',
            hintStyle: TextStyle(
                color: OrmeeColor.grey[30],
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
            counterText: '',
            border: InputBorder.none
        ),
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: OrmeeColor.purple[40],
        ),
        onSubmitted: (value) {
          quizCreateController.answers[index] = value;
        },
      ),
    );
  }

  void openOrmeeSelect(int index) {
    final LayerLink layerLink = quizCreateController.layerLinks[index];
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => OrmeeSelect(
        answerList: quizCreateController.optionControllers[index].map((controller) => controller.text).toList(),
        layerLink: layerLink,
        onSelect: (selected) {
          quizCreateController.answers[index] = selected;
          overlayEntry?.remove();
          overlayEntry = null;
        },
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }
}
