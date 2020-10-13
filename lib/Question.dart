import 'package:flutter/cupertino.dart';

class Question {
  int testNum;
  int questionNumber;
  String question;
  List<String> answers;
  String image = '';
  String explain;
  Question(
      {@required this.answers,
      @required this.question,
      @required this.image,
      @required this.questionNumber,
      @required this.testNum,
      @required this.explain});

  List<String> get getSuffiledanswers {
    List<String> a = [...answers];
    a.shuffle();
    return a;
  }
}

class QFinal {
  static List<Question> questions = [
    Question(
        answers: [
          " التنظيم والإبتكار",
          " الإستجابة الميكانيكية",
          "الإستجابة الموجهة",
          " الإستجابة"
        ],
        question:
            "المستوى الذي يرتبط بعملية الإبداع والتنظيم والتطوير لمهارات حركية جديدة",
        image: null,
        questionNumber: 1,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " يتركز إداركهم على بعد واحد",
          "يدركون أن الأشياء تتداخل في اكثر من علاقة",
          " ينمو تفكيرهم حول ذواتهم",
          "يستطيعون فهم وجهة النظر البديلة"
        ],
        question:
            "قام بياجيه بإعطاء أطفاله الكرات الخشبية البيضاء والخضراء وسألهم أيهم أكثر فأجابوا أن الكرات الخضراء أكثر وعندما سألهم هل هناك كرات خشبية لم يتمكن الأطفال من الإجابة ومن هنا نستدل أن الأطفال",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          "تقوي دافعية المتعلم",
          "ليس لها تأثير على الإستجابة",
          "تقلل من الإستجابة المتعلمة",
          "تؤثر على ذاكرة المتعلم"
        ],
        question: "إثابة المتعلم أثناء عملية التعليم :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " الحس حركية _ ما قبل العمليات المحسوسة - العمليات المحسوسة - العمليات المجردة",
          " الحس حركية - العمليات المحسوسة - العمليات المجردة",
          "العمليات المحسوسة - الحس حركية - ما قبل العمليات - العمليات المجردة",
          " العمليات المحسوسة - ما قبل العمليات - الحس حركية - العمليات المجردة"
        ],
        question: "مراحل التطور العقلي عند بياجيه :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " الرغبة في اثبات الذات والاستقلالية",
          " يغلب عليه حب التملك والإثارة",
          " فكرته عن السلطة مزيج من التقدير لها والخوف منها",
          "احساسه بالمسؤولية ضئيل ومحدود"
        ],
        question: "من خصائص النمو الانفعالي للمرحلة المتوسطة :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [" العقلية", " الطبيعية", "الاجتماعية", "الانفعالية"],
        question:
            "أحمد معلم مرحلة ثانوية أراد أن يوجه طلابه نحو مستقبلهم التعليمي والمهني لذا عليه أن يراعي خصائص الطالب :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " النمو المعرفي",
          "النمو المهاري",
          " النمو الشامل",
          " النمو الشامل"
        ],
        question: "جوانب النمو التي يؤكد عليها المنهج بالمفهوم القديم :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " تبدأ من الولادة وحتى الثانية",
          " تبدأ من سن السابعة وحتى الحادية عشر",
          "تبدأ من سن الحادية عشر",
          "تبدأ من سن السابعة وحتى الحادية عشر"
        ],
        question: "مرحلة العمليات الحس حركية :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: ["السلوكية", "المعرفيه", "البنائيه", "المثالية"],
        question:
            "التعلم هو ما يحدث من تغيرات لدى الفرد يمكن ملاحظتها وقياسها نتيجة لمروره بخبرة التعلم تنيب هذه الرؤية لأصحاب المدرسة:",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [" الدافعية", "الحوافز", "التكرار", "التغذية الراجعة"],
        question: "أي مما يأتي يعتبر شرطاً من الشروط الرئيسة للتعلم :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
    Question(
        answers: [
          " الاستفادة من الخبرات السابقة الى اكتساب خبرات جديدة",
          "مراعاة الجانب الوجداني في التدريس",
          "الانتقال من المعارف المجردة الى الحسية",
          " دمج النشاطات الوجدانية مع الحركية"
        ],
        question: "التعلم ذو المعنى حسب نظرية أوزبيتل :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),





    Question(
        answers: [
          " التعلم ذي المعنى لأوزوبل",
          " البنائية لبياجيه",
          "الإرتباط لثورندايك",
          "الإشراط لبافلوف"
        ],
        question: "طريقة التدريس بإستخدام خرائط المفاهيم تعتبر تطبيق لنظرية :",
        image: null,
        questionNumber: 9,
        testNum: 1,
        explain: "Hian4dM4GQo"),
  ];
}
