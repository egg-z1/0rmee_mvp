import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/designs/Indicator.dart';
import 'package:ormee_mvp/designs/StickyHeaderDelegate.dart';

var profileImage;

class LectureDetail extends StatelessWidget {
  const LectureDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: OrmeeAppBar(
        title: "오름토익 기본반 RC",
        rightIcon: SvgPicture.asset("assets/icons/mail-02.svg"),
      ),
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // 선생님 프로필
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                              image: profileImage != null
                                  ? DecorationImage(
                                      image: NetworkImage(profileImage),
                                      fit: BoxFit.cover)
                                  : DecorationImage(
                                      image: AssetImage(
                                          'assets/images/user-profile-03.png'),
                                    ),
                            ),
                          ),
                          SizedBox(width: 8),
                          T4_16px(text: "강수이"),
                          SizedBox(width: 2),
                          C1_12px_M(text: "RC"),
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
                              text: "퀴즈",
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
              ListView.builder(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                itemCount: 100,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                              text: "6주차 퀴즈",
                              color: OrmeeColor.gray[900],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            C1_12px_M(
                              text: "2024.06.06 (수)",
                              color: OrmeeColor.gray[400],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
