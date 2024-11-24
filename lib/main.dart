import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/auth/view.dart';
import 'package:ormee_mvp/screens/home/view.dart';
import 'package:ormee_mvp/screens/lecture_detail/view.dart';
import 'package:ormee_mvp/screens/quiz/view.dart';
import 'package:ormee_mvp/screens/quiz_answer/view.dart';
import 'package:ormee_mvp/screens/quiz_detail/view.dart';

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
      title: 'Peeroreum',
      home: LectureDetail(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
        GetPage(
          name: '/auth',
          page: () => Authentication(),
        ),
        GetPage(
          name: '/lecture/detail',
          page: () => LectureDetail(),
        ),
        GetPage(
          name: '/quiz',
          page: () => Quiz(),
        ),
        GetPage(
          name: '/quiz/detail',
          page: () => QuizDetail(),
        ),
        GetPage(
          name: '/quiz/answer',
          page: () => QuizAnswer(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
