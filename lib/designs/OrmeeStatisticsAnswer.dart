import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/quiz/view_model.dart';

class OrmeeStatisticsAnswer extends StatefulWidget {
  final int problemNum;
  final TeacherProblemStatisticsController controller;
  final VoidCallback onClose;

  const OrmeeStatisticsAnswer({
    Key? key,
    required this.problemNum,
    required this.controller,
    required this.onClose,
  }) : super(key: key);

  @override
  State<OrmeeStatisticsAnswer> createState() => _OrmeeStatisticsAnswerState();
}

class _OrmeeStatisticsAnswerState extends State<OrmeeStatisticsAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 680,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        color: OrmeeColor.white,
        borderRadius: BorderRadius.circular(10),
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
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () {
              if (widget.controller.problemStatistics.value == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size(24, 24)),
                          onPressed: () {
                            widget.onClose();
                          },
                          icon: Icon(
                            Icons.close,
                            color: OrmeeColor.grey[40],
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Headline1_Bold(
                      text: '문항 ${widget.problemNum}',
                      color: OrmeeColor.purple[40],
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 13),
                      child: Body1_Regular(
                        text:
                            widget.controller.problemStatistics.value!.content,
                        color: OrmeeColor.grey[90],
                      ),
                    ),
                    if (widget.controller.problemStatistics.value!.type ==
                        "ESSAY")
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                color: OrmeeColor.purple[5],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Label1(
                                text: '정답',
                                color: OrmeeColor.purple[40],
                              ),
                            ),
                            SizedBox(width: 10),
                            Headline2_Semibold(
                              text: widget
                                  .controller.problemStatistics.value!.answer,
                              color: OrmeeColor.purple[4],
                            ),
                          ],
                        ),
                      ),
                    if (widget.controller.problemStatistics.value!.type ==
                        "ESSAY")
                      Expanded(child: essayCard()),
                    if (widget.controller.problemStatistics.value!.type ==
                        "CHOICE")
                      Expanded(child: choiceCard()),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  choiceCard() {
    final statistics = widget.controller.problemStatistics.value;
    if (statistics == null) return Container();

    bool nullAnswer =
        statistics.results.isNotEmpty && statistics.results[0].option == '무응답';

    return Container(
      color: OrmeeColor.grey[5],
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 9),
            itemCount: nullAnswer
                ? statistics.results.length - 1
                : statistics.results.length,
            itemBuilder: (context, index) {
              // nullAnswer일 때는 index + 1로 실제 결과 접근
              final resultIndex = nullAnswer ? index + 1 : index;
              final result = statistics.results[resultIndex];
              final isAnswer = result.option == statistics.answer;

              return Container(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      isAnswer
                          ? "assets/icons/checked_round.svg"
                          : "assets/icons/default_round.svg",
                      width: 20,
                      height: 20,
                      color: isAnswer ? OrmeeColor.purple[40] : null,
                    ),
                    const SizedBox(width: 18),
                    isAnswer
                        ? Headline2_Semibold(
                            text: result.option,
                            color: OrmeeColor.purple[40],
                          )
                        : Headline2_Regular(
                            text: result.option,
                            color: OrmeeColor.grey[70],
                          ),
                    isAnswer
                        ? Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            decoration: BoxDecoration(
                              color: OrmeeColor.purple[5],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Label1(
                              text: '정답',
                              color: OrmeeColor.purple[40],
                            ),
                          )
                        : Container(),
                    const SizedBox(width: 28),
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: OrmeeColor.grey[20],
                    ),
                    const SizedBox(width: 1),
                    Headline2_Regular(
                      text: '${result.count}',
                      color: OrmeeColor.grey[90],
                    ),
                  ],
                ),
              );
            },
          ),
          if (nullAnswer)
            Container(
              padding: EdgeInsets.only(top: 9),
              child: Row(
                children: [
                  const SizedBox(width: 38),
                  Headline2_Regular(
                    text: '무응답',
                    color: OrmeeColor.grey[50],
                  ),
                  const SizedBox(width: 28),
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    color: OrmeeColor.grey[20],
                  ),
                  const SizedBox(width: 1),
                  Headline2_Regular(
                    text: '${statistics.results[0].count}',
                    color: OrmeeColor.grey[90],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget essayCard() {
    final statistics = widget.controller.problemStatistics.value;
    if (statistics == null) return Container();

    bool nullAnswer =
        statistics.results.isNotEmpty && statistics.results[0].rank == -1;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: OrmeeColor.grey[5],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 71,
                child: Center(
                  child: Label1(
                    text: '순위',
                    color: OrmeeColor.grey[60],
                  ),
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 150,
                child: Center(
                  child: Label1(
                    text: '응답',
                    color: OrmeeColor.grey[60],
                  ),
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 71,
                child: Center(
                  child: Label1(
                    text: '오답 인원',
                    color: OrmeeColor.grey[60],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    nullAnswer
                        ? statistics.results.length - 1
                        : statistics.results.length,
                    (index) {
                      final resultIndex = nullAnswer ? index + 1 : index;
                      final result = statistics.results[resultIndex];

                      return Container(
                        padding: resultIndex == statistics.results.length - 1
                            ? EdgeInsets.zero
                            : EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 71,
                              child: Center(
                                child: Headline2_Semibold(
                                  text: '${result.rank}',
                                  color: OrmeeColor.grey[50],
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            SizedBox(
                              width: 150,
                              child: Center(
                                child: Headline2_Regular(
                                  text: '${result.content}',
                                  color: OrmeeColor.grey[90],
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            SizedBox(
                              width: 71,
                              child: Center(
                                child: Headline2_Regular(
                                  text: '${result.count}',
                                  color: OrmeeColor.grey[90],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  if (nullAnswer)
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 71,
                            child: Center(
                              child: Headline2_Semibold(
                                text: '-',
                                color: OrmeeColor.grey[50],
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            width: 150,
                            child: Center(
                              child: Headline2_Regular(
                                text: '무응답',
                                color: OrmeeColor.grey[90],
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            width: 71,
                            child: Center(
                              child: Headline2_Regular(
                                text: '${statistics.results[0].count}',
                                color: OrmeeColor.grey[90],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
