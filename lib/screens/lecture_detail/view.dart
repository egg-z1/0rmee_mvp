// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/designs/indicator.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            // 선생님 프로필
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        color: OrmeeColor.gray[100]!, // 테두리 색상
                        width: 1.0, // 테두리 두께
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
                  SizedBox(
                    width: 8,
                  ),
                  // 선생님 이름
                  T4_16px(text: "강수이"),
                  SizedBox(
                    width: 2,
                  ),
                  // 과목 이름
                  C1_12px_M(text: "RC"),
                ],
              ),
            ),
            SizedBox(
              height: 12,
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
    );
  }
}
