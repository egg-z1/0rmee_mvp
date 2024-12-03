import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class TeacherSideMenu extends StatelessWidget {
  const TeacherSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OrmeeColor.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            // teacher info,
            teacherInfo(),
            // divider,
            Divider(
              height: 1.2,
              color: OrmeeColor.gray[200],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            // my lecture,
            myLecture(),
            // spacer,
            Spacer(),
            // divider,
            Divider(
              height: 1.2,
              color: OrmeeColor.gray[200],
            ),
            // logout
            logout(),
          ],
        ),
      ),
    );
  }

  Widget teacherInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: OrmeeColor.gray[100]!)),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: OrmeeColor.gray[300],
                image: DecorationImage(
                    image: AssetImage('assets/images/user-profile-03.png')),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T2_20px(
                text: '강수이',
                color: OrmeeColor.primaryPuple[500],
              ),
              SizedBox(
                height: 2,
              ),
              T4_16px(
                text: '선생님',
                color: OrmeeColor.gray[500],
              )
            ],
          ),
          Spacer(),
          Container(
            color: OrmeeColor.error,
            child: SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              color: OrmeeColor.gray[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget myLecture() {
    return Container();
  }

  Widget logout() {
    return Container();
  }
}
