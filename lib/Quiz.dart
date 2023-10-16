import 'dart:async';
import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neb_computer12/homepage.dart';
import 'package:neb_computer12/main.dart';
import 'package:neb_computer12/result.dart';
import 'package:provider/provider.dart';
import 'Model/filteredquiz.dart';
import 'Model/model.dart';

class Quiz11 extends StatefulWidget {
  final String chapter;
  final int classname;
  const Quiz11({required this.chapter, required this.classname, Key? key})
      : super(key: key);

  @override
  State<Quiz11> createState() => _Quiz11State();
}

class _Quiz11State extends State<Quiz11> {
  late PageController pagecontroller;
  var _value = 0;
  int res = 0;

  @override
  void initState() {
    super.initState();
    pagecontroller = PageController(initialPage: 0);
    starttimer();
  }

  Future<List<Quiz>> getdata(String level) async {
    final List<Quiz> selected = [];
    if (widget.classname == 11) {
      final providerlist = Provider.of<Quizmodel11>(context);
      List<Quiz> connect = await providerlist.data;
      for (var q in connect) {
        if (q.level == level) {
          selected.add(Quiz(
              id: q.id,
              category: q.category,
              subcategory: q.subcategory,
              question: q.question,
              optiona: q.optiona,
              optionb: q.optionb,
              optionc: q.optionc,
              optiond: q.optiond,
              answer: q.answer,
              level: q.level));
        }
      }
    } else {
      final providerlist = Provider.of<Quizmodel12>(context);
      List<Quiz> connect = await providerlist.data;
      for (var q in connect) {
        if (q.level == level) {
          selected.add(Quiz(
              id: q.id,
              category: q.category,
              subcategory: q.subcategory,
              question: q.question,
              optiona: q.optiona,
              optionb: q.optionb,
              optionc: q.optionc,
              optiond: q.optiond,
              answer: q.answer,
              level: q.level));
        }
      }
    }
    return selected;
  }

  static const maxseconds = 180;
  int second = maxseconds;
  Timer? timer;
  void starttimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (second > 0) {
        setState(() {
          second--;
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final isselected = Provider.of<Isselected>(context, listen: false);

    void check(Quiz quiz, int total, int index) {
      //num++;
      second = maxseconds;

      if (_value == 1) {
        pagecontroller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
        if (quiz.answer == 'a') {
          res++;
        }
        isselected.add('a');
        _value = 0;
      } else if (_value == 2) {
        pagecontroller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
        if (quiz.answer == 'b') {
          res++;
        }
        isselected.add('b');
        _value = 0;
      } else if (_value == 3) {
        pagecontroller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
        if (quiz.answer == 'c') {
          res++;
        }
        isselected.add('c');
        _value = 0;
      } else if (_value == 4) {
        pagecontroller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
        if (quiz.answer == 'd') {
          res++;
        }
        isselected.add('d');
        _value = 0;
      } else if (_value == 0) {
        pagecontroller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );

        isselected.add('e');
        _value = 0;
      }

      Provider.of<Filteredquiz>(context, listen: false).addquiz(quiz);
      if (index == total - 1) {
        timer!.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => Result(
                  res: res,
                  total: total,
                )),
          ),
        );
      }
    }

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showAlertDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text('General Knowledge'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Quiz>>(
          future: getdata(widget.chapter),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: pagecontroller,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05,
                                  top: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.28,
                                child: Stack(
                                  children: [
                                    CustomPaint(
                                      size: Size(
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                      painter: Customcontainer(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3),
                                      child: Text(
                                          "Question: " +
                                              (index + 1).toString() +
                                              "/" +
                                              snapshot.data!.length.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.11,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.36,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.36,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                      ),
                                      child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            CircularProgressIndicator(
                                              value: 1 - second / maxseconds,
                                              backgroundColor:
                                                  AppInfo.currentAppColor,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                              strokeWidth: 7,
                                            ),
                                            Center(
                                              child: Text(second.toString()),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    // top: MediaQuery.of(context).size.height * 0.278,
                                    bottom: 57,
                                    left: 15,
                                    right: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (index + 1).toString() + ")",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                          height: 30,
                                        ),
                                        Flexible(
                                          child: Text(
                                            snapshot.data![index].question,
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    SizedBox(
                                      child: snapshot
                                              .data![index].optionc.isNotEmpty
                                          ? Column(
                                              children: [
                                                row(
                                                    count: 1,
                                                    option: snapshot
                                                        .data![index].optiona),
                                                row(
                                                    count: 2,
                                                    option: snapshot
                                                        .data![index].optionb),
                                                row(
                                                    count: 3,
                                                    option: snapshot
                                                        .data![index].optionc),
                                                row(
                                                    count: 4,
                                                    option: snapshot
                                                        .data![index].optiond),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                row(
                                                    count: 1,
                                                    option: snapshot
                                                        .data![index].optiona),
                                                row(
                                                    count: 2,
                                                    option: snapshot
                                                        .data![index].optionb),
                                              ],
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 55,
                            color: Colors.grey.shade100,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                      onPressed: () async {
                                        final exit =
                                            await showAlertDialog(context);
                                        if (exit.toString() == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()),
                                          );
                                        }
                                      },
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(160, 48),
                                      ),
                                      child: Text(
                                        "Quit",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )),
                                  DurationButton(
                                    height: 45,
                                    width: 160,
                                    duration: Duration(seconds: 180),
                                    coverColor: Colors.transparent,
                                    backgroundColor: AppInfo.currentAppColor,
                                    onComplete: () {
                                      check(snapshot.data![index],
                                          snapshot.data!.length, index);
                                    },
                                    onPressed: () {
                                      if (_value == 0) {
                                        Fluttertoast.showToast(
                                          msg: "Please choose one option!",
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.black,
                                          fontSize: 15.0,
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                        );
                                      } else {
                                        check(snapshot.data![index],
                                            snapshot.data!.length, index);
                                      }
                                    },
                                    child: Center(
                                        child: const Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }

  Widget row({
    required int count,
    required String option,
  }) {
    return RadioListTile(
      title: Text(option),
      activeColor: AppInfo.currentAppColor,
      value: count,
      groupValue: _value,
      onChanged: (newvalue) {
        setState(() {
          _value = newvalue as int;
        });
      },
    );
  }

  Future<bool?> showAlertDialog(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              "Exit",
            ),
          ),
          content: Text("Do you really want to quit?"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Provider.of<Filteredquiz>(context, listen: false).clearquiz();
                Provider.of<Isselected>(context, listen: false).clear();
                timer!.cancel();
                Navigator.pop(context, true);
              },
              child: Text("Yes"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("No"),
            ),
          ],
        ),
      );
}

class Customcontainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppInfo.currentAppColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, size.height);

    path.lineTo(size.width * 0.3, size.height);
    path.quadraticBezierTo(
        size.width * 0.35, size.height, size.width * 0.35, size.height * 0.95);

    /* path.arcToPoint(Offset(size.width * 0.65, size.height * 0.9),
        radius: Radius.circular(5)); */
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.25,
        size.width * 0.65, size.height * 0.95);
    path.quadraticBezierTo(
        size.width * 0.65, size.height, size.width * 0.7, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
