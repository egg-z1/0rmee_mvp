import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/SideMenu.dart';

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
            SizedBox(width: 350, child: TeacherSideMenu())
            // body
          ],
        ),
      ),
    );
  }
}
