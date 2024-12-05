import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: AppBar(),
      body: Container(
        child: Row(
          children: [
            // sidemenu,
            SizedBox(width: 348, child: TeacherSideMenu()),
            Container(
              decoration: BoxDecoration(
                color: OrmeeColor.gray[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: -20,
                    blurRadius: 20,
                  )
                ],
              ),
              width: 1,
            ),
            // body
            Container(
              color: OrmeeColor.white,
              width: MediaQuery.of(context).size.width - 500,
            )
          ],
        ),
      ),
    );
  }
}
