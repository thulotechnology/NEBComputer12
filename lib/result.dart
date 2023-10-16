import 'dart:io';
import 'package:flutter/material.dart';
import 'package:neb_computer12/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'Model/filteredquiz.dart';
import 'answer.dart';

class Result extends StatefulWidget {
  final int res, total;

  Result({required this.res, required this.total, Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

ScreenshotController screenshotcontroller = ScreenshotController();
void share() async {
  try {
    final image = await screenshotcontroller.capture();
    final directory = await getTemporaryDirectory();
    final imagePath = await File('${directory.path}/image.png').create();
    imagePath.writeAsBytesSync(image!);
    Share.shareFiles([imagePath.path]);
  } catch (e) {
    print(e);
  }
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    late int wrong = widget.total - widget.res;
    late double pct = (widget.res / widget.total) * 100;

    return WillPopScope(
      onWillPop: () async {
        Provider.of<Filteredquiz>(context, listen: false).clearquiz();
        Provider.of<Isselected>(context, listen: false).clear();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Screenshot(
            controller: screenshotcontroller,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xFFf0f0f2),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppInfo.currentAppColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: pct < 70
                            ? Text(
                                "You need to work hard !",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              )
                            : pct == 100
                                ? Text(
                                    "Excellent !",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Good !",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CircleAvatar(
                          radius: 95,
                          backgroundColor: Colors.blue.shade400,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.blue.shade300,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Score',
                                    style: TextStyle(
                                        color: AppInfo.textAppColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    '${widget.res}/${widget.total}',
                                    style: TextStyle(
                                        color: AppInfo.textAppColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 0.9,
                        color: Colors.white,
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  row(
                                      first: '${widget.total}',
                                      second: 'Total Question',
                                      icon: Icons.quiz,
                                      color: Colors.black),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  row(
                                      first: '${widget.res}',
                                      second: 'Correct answer',
                                      icon: Icons.check,
                                      color: Colors.green),
                                  //
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () => share(),
                                      child: row(
                                          first: 'Share',
                                          second: 'with friends',
                                          icon: Icons.share,
                                          color: AppInfo.currentAppColor,
                                          id: 1)
                                      //
                                      ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  row(
                                      first: '$wrong',
                                      second: 'Wrong answer',
                                      icon: Icons.clear,
                                      color: Colors.red),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: const Size(220, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Answer(),
                            ),
                          );
                        },
                        child: const Text(
                          'View Answer',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: const Size(220, 40),
                        ),
                        onPressed: () {
                          Provider.of<Filteredquiz>(context, listen: false)
                              .clearquiz();
                          Provider.of<Isselected>(context, listen: false)
                              .clear();

                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Quit Game',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget row({
    required String first,
    required String second,
    required IconData icon,
    required Color color,
    int? id,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              first,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: id == 1 ? FontWeight.normal : FontWeight.bold,
                  color: id == 1 ? Colors.black : color),
            ),
            Text(
              second,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
