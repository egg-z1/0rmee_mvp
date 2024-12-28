import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/branching/view.dart';
import 'package:ormee_mvp/screens/lecture_detail/view.dart';
import 'package:ormee_mvp/screens/quiz/view.dart';
import 'package:ormee_mvp/screens/quiz_answer/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OrmeeApp());
}

class OrmeeApp extends StatelessWidget {
  const OrmeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: OrmeeColor.white,
                  statusBarIconBrightness: Brightness.dark))),
      title: 'Ormee',
      home: Branch(),
      getPages: [
        GetPage(
          name: '/ClassCode/:lectureId', // URL 경로로 lectureId를 전달
          page: () => LectureDetail(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
