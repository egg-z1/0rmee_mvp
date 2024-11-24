import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('퀴즈 페이지'),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            T4_16px(text: '틀린문제 제출!'),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon:
                                    SvgPicture.asset("assets/icons/xLarge.svg"))
                          ],
                        ),
                        SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: OrmeeColor.gray[100]!,
                              )),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              C1_12px_M(
                                  text: '받는 사람:', color: OrmeeColor.gray[500]),
                              C1_12px_M(text: '오르미 T'),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 310,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: OrmeeColor.gray[600]!),
                              color: OrmeeColor.gray[100]),
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Pretendard',
                              color: Colors.black,
                            ),
                            cursorColor: OrmeeColor.gray[600],
                            decoration: InputDecoration(
                              hintText:
                                  '번호는 쉼표로 구분해서 제출해 주세요.\nex) 1, 7, 18, 22',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard',
                                color: OrmeeColor.gray[400]!,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              border: InputBorder.none,
                            ),
                            maxLines: 2, // 여러 줄로 설정
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
