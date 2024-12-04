import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/designs/Indicator.dart';
import 'package:ormee_mvp/designs/StickyHeaderDelegate.dart';
import 'package:ormee_mvp/screens/lecture_detail/view_model.dart';

class LectureDetail extends StatelessWidget {
  final LectureController controller = Get.put(LectureController());
  TextEditingController _controller = TextEditingController();
  var isTextFieldNotEmpty = false.obs; // Rx로 상태 관리

  LectureDetail({super.key});
  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      isTextFieldNotEmpty.value = _controller.text.isNotEmpty;
    });

    final String lectureId = "5465"; // 예시용 ID
    controller.fetchLectureDetail(lectureId);

    return Obx(
      () => Scaffold(
        backgroundColor: OrmeeColor.white,
        appBar: OrmeeAppBar(
          title: controller.lectureDetail.value?.title ?? "",
          rightIcon: controller.lectureDetail.value?.messageAvailable == true
              ? SvgPicture.asset("assets/icons/mail-02.svg")
              : null,
          rightAction: controller.lectureDetail.value?.messageAvailable == true
              ? () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return customDialog(context, _controller,
                          isTextFieldNotEmpty); // 분리된 위젯 함수 호출
                    },
                  );
                }
              : null,
          rightIconColor: OrmeeColor.primaryPuple[400],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          final detail = controller.lectureDetail.value;
          if (detail == null) {
            return Center(child: Text('No lecture details available'));
          }
          return RefreshIndicator(
            onRefresh: () => controller.fetchLectureDetail(lectureId),
            child: DefaultTabController(
              length: 1,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // 선생님 프로필
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: OrmeeColor.gray[100],
                                    border: Border.all(
                                      color: OrmeeColor.gray[100]!,
                                      width: 1.0,
                                    ),
                                    image: DecorationImage(
                                      image: detail.profileImage != null
                                          ? NetworkImage(detail.profileImage!)
                                              as ImageProvider
                                          : AssetImage(
                                              'assets/images/defalut_profile.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                T4_16px(text: "${detail.name}"),
                              ],
                            ),
                          ),
                          // 중앙 분리선
                          Container(
                            color: OrmeeColor.gray[50],
                            height: 8,
                            width: double.maxFinite,
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: StickyTabBarDelegate(
                        tabBar: TabBar(
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          tabs: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 130,
                                child: Tab(
                                  child: T5_14px(
                                    text: "퀴즈 ${detail.activeQuizCount}",
                                    color: OrmeeColor.primaryPuple[400],
                                  ),
                                ),
                              ),
                            ),
                          ],
                          labelColor: OrmeeColor.primaryPuple[400],
                          unselectedLabelColor: OrmeeColor.gray[800],
                          indicator: CustomLabelIndicator(
                            color: OrmeeColor.primaryPuple[400]!,
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    // 퀴즈 리스트
                    Obx(() {
                      final quizList = controller.lectureDetail.value?.quizList;

                      if (quizList == null || quizList.isEmpty) {
                        return Center(child: Text("No quizzes available"));
                      }

                      return ListView.builder(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        itemCount: quizList.length,
                        itemBuilder: (context, index) {
                          final quiz = quizList[index];
                          return Padding(
                            // return 문 추가
                            padding: EdgeInsets.only(bottom: 16),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: OrmeeColor.gray[200]!,
                                  width: 1.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      T4_16px(
                                        text: "${quiz.quizName}",
                                        color: quiz.quizAvailable
                                            ? OrmeeColor.gray[900]
                                            : OrmeeColor.gray[300],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      C1_12px_M(
                                        text: "${quiz.quizDate}",
                                        color: OrmeeColor.gray[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ); // return 문 끝
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget customDialog(BuildContext context, TextEditingController controller,
    RxBool isTextFieldNotEmpty) {
  return Dialog(
    child: Container(
      decoration: BoxDecoration(
        color: OrmeeColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: T4_16px(
                  text: ' 제출!',
                  overflow: TextOverflow.visible,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset("assets/icons/xLarge.svg"),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: OrmeeColor.gray[100]!,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                C1_12px_M(text: '받는 사람:', color: OrmeeColor.gray[500]),
                C1_12px_M(text: '오르미 T'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: OrmeeColor.gray[100]!),
              color: OrmeeColor.gray[100],
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard',
                color: Colors.black,
              ),
              cursorColor: OrmeeColor.gray[600],
              decoration: InputDecoration(
                hintText: '번호는 쉼표로 구분해서 제출해 주세요.\nex) 1, 7, 18, 22',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pretendard',
                  color: OrmeeColor.gray[400]!,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: InputBorder.none,
                fillColor: OrmeeColor.gray[100],
              ),
              maxLines: null, // 여러 줄로 설정
              onChanged: (value) {
                // 제한된 문자만 남김
                final filteredValue =
                    value.replaceAll(RegExp(r'[^0-9,\s]'), '');
                if (value != filteredValue) {
                  controller.value = TextEditingValue(
                    text: filteredValue,
                    selection:
                        TextSelection.collapsed(offset: filteredValue.length),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Spacer(),
              Obx(() {
                // isTextFieldNotEmpty 값에 따라 버튼 스타일 변경
                return TextButton(
                  onPressed: isTextFieldNotEmpty.value
                      ? () {} // 텍스트가 있으면 버튼 클릭 가능
                      : null, // 텍스트가 없으면 버튼 클릭 불가
                  child: C1_12px_M(
                    text: "제출하기",
                    color: isTextFieldNotEmpty.value
                        ? OrmeeColor.white
                        : OrmeeColor.gray[600]!,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isTextFieldNotEmpty.value
                        ? OrmeeColor.primaryPuple[300]
                        : OrmeeColor.gray[100]!,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              })
            ],
          )
        ],
      ),
    ),
  );
}
