import 'package:flutter/material.dart';
import 'OrmeeColor.dart';

//--------------Title Sb--------------
class T1_28px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T1_28px({
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
          fontSize: 28,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

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

class T4_20px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T4_20px({
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

class T5_18px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T5_18px({
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

class T6_16px extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const T6_16px({
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

class B4_16px_M extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const B4_16px_M({
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

//--------------Teacher System Typo--------------

class Display1_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display1_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 56,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Display1_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display1_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 56,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Display1_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display1_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 56,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Display2_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display2_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 40,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Display2_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display2_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 40,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Display2_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Display2_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 40,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title1_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title1_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 28,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title1_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title1_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 28,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title1_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title1_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 28,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title2_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title2_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 26,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title2_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title2_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 26,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title2_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title2_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 26,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title3_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title3_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 24,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Title3_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title3_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Title3_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Title3_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Heading1_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading1_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 22,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Heading1_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading1_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 22,
          fontWeight: FontWeight.w600),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Heading1_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading1_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 22,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Heading2_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading2_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 20,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Heading2_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading2_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Heading2_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Heading2_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Headline1_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline1_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Headline1_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline1_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Headline1_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline1_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Headline2_Bold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline2_Bold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 16,
          fontWeight: FontWeight.w700),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Headline2_Semibold extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline2_Semibold({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Headline2_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Headline2_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 16,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Body_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Body_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Body1_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Body1_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 16,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Body2_Regular extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Body2_Regular({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Label1 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Label1({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Label2 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Label2({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

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

class Caption1 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Caption1({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 11,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}

class Caption2 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextOverflow? overflow;

  const Caption2({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color ?? OrmeeColor.black,
          fontFamily: 'Pretendard',
          fontSize: 11,
          fontWeight: FontWeight.w400),
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}