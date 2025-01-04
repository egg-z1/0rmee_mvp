import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/branching/view.dart';
import 'package:ormee_mvp/screens/classcode/view.dart';
import 'package:ormee_mvp/screens/lecture_detail/view.dart';
import 'package:ormee_mvp/screens/teacher/home/view_model.dart';
import 'package:ormee_mvp/screens/teacher/main/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/view.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(LectureListController());
  Get.put(TeacherHomeController());
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
          child: child ?? const SizedBox.shrink(),
        );
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: OrmeeColor.white,
                  statusBarIconBrightness: Brightness.dark))),
      title: 'Ormee',
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      getPages: [
        GetPage(name: '/', page: () => Branch()),
        GetPage(
          name: '/ClassCode/:lectureId', // URL 경로로 lectureId를 전달
          page: () => LectureDetail(),
        ),
        GetPage(
          name: '/ClassCode',
          page: () => ClassCode(),
        ),
        GetPage(name: '/teacher/signIn', page: () => TeacherSignIn()),
        GetPage(name: '/teacher/main', page: () => TeacherMain()),
        GetPage(name: '/teacher/quiz', page: () => Quizcreate()),
        GetPage(name: '/teacher/quiz/detail', page: () => QuizDetail()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
