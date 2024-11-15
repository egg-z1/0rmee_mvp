import 'package:flutter/material.dart';
import 'OrmeeColor.dart';

//--------------Title Sb--------------

class T1_24px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T1_24px({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 24,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class T2_20px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T2_20px({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class T3_18px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T3_18px({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class T4_16px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T4_16px({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 16,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class T5_14px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T5_14px({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

//--------------Body M--------------

class B1_24px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B1_24px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 24,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B2_20px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B2_20px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B3_18px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B3_18px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B4_14px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B4_14px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

//--------------Body R--------------

class B1_24px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B1_24px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 24,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B2_20px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B2_20px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B3_18px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B3_18px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class B4_14px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B4_14px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color ?? OrmeeColor.black,
        fontFamily: 'Pretendard',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

//--------------Caption R--------------

class C1_12px_Sb extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C1_12px_Sb({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 12,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class C1_12px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C1_12px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 12,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class C1_12px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C1_12px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 12,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class C2_10px_Sb extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C2_10px_Sb({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 10,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class C2_10px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C2_10px_M({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 10,
          fontWeight: FontWeight.w500),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class C2_10px_R extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const C2_10px_R({
    Key? key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 10,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}
