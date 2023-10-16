import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:neb_computer12/Chapter.dart';
import 'package:neb_computer12/abount_brp.dart';
import 'package:neb_computer12/ad_state.dart';
import 'package:neb_computer12/main.dart';
import 'package:neb_computer12/privacy_policy.dart';
import 'package:neb_computer12/quiz.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chapter_read.dart';
import 'developerui.dart';

void shareApp() async {
  try {
    Share.share("https://play.google.com/store/apps/details?id=com.neb12.com");
  } on Exception {}
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// For Ad
BannerAd? banner;
InterstitialAd? intres;

class _HomePageState extends State<HomePage> {
  List<String> classList = ["Class 12", "Class 11"];
  String className = "Class 12";

  // End of Ad

// For Class 12
  List<Chapter> _chapter1 = chapter1;
  List<Chapter> _chapter2 = chapter2;
  List<Chapter> _chapter3 = chapter3;
  List<Chapter> _chapter4 = chapter4;
  List<Chapter> _chapter5 = chapter5;
  List<Chapter> _chapter6 = chapter6;
  List<Chapter> _chapter7 = chapter7;

// For Class 11
  List<Chapter> __chapter1 = chapter_1;
  List<Chapter> __chapter2 = chapter_2;
  List<Chapter> __chapter3 = chapter_3;
  List<Chapter> __chapter4 = chapter_4;
  List<Chapter> __chapter5 = chapter_5;
  List<Chapter> __chapter6 = chapter_6;
  List<Chapter> __chapter7 = chapter_7;
  List<Chapter> __chapter8 = chapter_8;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            adUnitId: adState.bannerAdUnitID,
            size: AdSize.banner,
            request: AdRequest(),
            listener: BannerAdListener())
          ..load();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadClass();
  }

  loadClass() async {
    final prefs = await SharedPreferences.getInstance();
    final classNames = prefs.getString('classname') ?? "Class 12";
    if (classNames == "Class 11") {
      setState(() {
        className = classNames;
      });
    }
  }

  saveClass(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('classname', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEB Computer"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppInfo.currentAppColor,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: className,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      className = newValue!;
                      saveClass(className);
                      print(className);
                    });
                  },
                  items:
                      classList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                          child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  '',
                  style: TextStyle(color: Colors.green, fontSize: 17),
                ),
                accountEmail: Text('', style: TextStyle(color: Colors.green)),
                currentAccountPicture: GestureDetector(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: className == "Class 12"
                          ? AssetImage('img/12/banner.png')
                          : AssetImage('img/11/banner.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Text(
                'Made in Nepal with Love',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0),
              ),
              className == "Class 12"
                  ? ListTile(
                      subtitle: Text(
                          'Learn by watching videos. You need active internet connection for this.'),
                      title: Text("Video Tutorials"),
                      trailing:
                          Icon(Icons.video_library, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeveloperUI()),
                        );
                      },
                    )
                  : ListTile(
                      subtitle: Text(
                          'Learn by watching videos. You need active internet connection for this.'),
                      title: Text("Video Tutorials"),
                      trailing:
                          Icon(Icons.video_library, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeveloperUI()),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter1: Database Management System"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 1)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 1: Introduction to Computer"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 1)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 2: Communication and Networking"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 2)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 2: Number System"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 2)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 3: Web Technology II"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 3)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text(
                          "Chapter 3: Computer Software and Operating System"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 3)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 4: Programming in C"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 4)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 4: Application Package"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 4)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 5: Object Oriented Programming"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 5)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 5: Programming Concept and Logic"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 5)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 6: Software Process Model"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 6)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 6: Web Technology"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 6)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? ListTile(
                      title: Text("Chapter 7: Recent Trends in Technology"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(12, 7)),
                        );
                      },
                    )
                  : ListTile(
                      title: Text("Chapter 7: Multimedia and Its Applications"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 7)),
                        );
                      },
                    ),
              Divider(),
              className == "Class 12"
                  ? SizedBox()
                  : ListTile(
                      title:
                          Text("Chapter 8: Information Security and Cyber Law"),
                      trailing: Icon(Icons.book, color: Colors.blueAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(11, 8)),
                        );
                      },
                    ),
              Divider(),
              ListTile(
                title: Text("About Bishworaj Poudel"),
                leading: Icon(Icons.person, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutBishworajUI()),
                  );
                },
              ),
              ListTile(
                title: Text("Share With Friends"),
                leading: Icon(Icons.share, color: Colors.blueAccent),
                onTap: () {
                  shareApp();
                },
              ),
              ListTile(
                title: Text("Rate Our App"),
                leading: Icon(Icons.rate_review, color: Colors.blueAccent),
                onTap: () {
                  launch(
                      "https://play.google.com/store/apps/details?id=com.neb12.com");
                },
              ),
              ListTile(
                title: Text("Send Feedback"),
                leading: Icon(Icons.feedback, color: Colors.blueAccent),
                onTap: () {
                  launch(
                      "mailto:thulotechnology@gmail.com?subject=Feedback From App&body= Write your message here");
                },
              ),
              ListTile(
                title: Text("Privacy Policy"),
                leading: Icon(Icons.policy, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.close, color: Colors.blueAccent),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
      body: className == "Class 12"
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ReusableChapter(
                          classID: 12,
                          chapterID: 1,
                          title: "Chapter 1",
                          level: '2001',
                          imageLocation: "img/12/ch1.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 1)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 2,
                          title: "Chapter 2",
                          level: '2002',
                          imageLocation: "img/12/ch2.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 2)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 3,
                          title: "Chapter 3",
                          level: '2003',
                          imageLocation: "img/12/ch3.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 3)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 4,
                          title: "Chapter 4",
                          level: '2004',
                          imageLocation: "img/12/ch4.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 4)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 5,
                          title: "Chapter 5",
                          level: '2005',
                          imageLocation: "img/12/ch5.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 5)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 6,
                          title: "Chapter 6",
                          level: '2006',
                          imageLocation: "img/12/ch6.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 6)),
                            );
                          }),
                      ReusableChapter(
                          classID: 12,
                          chapterID: 7,
                          title: "Chapter 7",
                          level: '2007',
                          imageLocation: "img/12/ch7.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(12, 7)),
                            );
                          }),
                      Divider(
                        height: 20,
                      )
                    ],
                  ),
                ),
                if (banner == null)
                  SizedBox()
                else
                  Container(
                    width: banner!.size.width.toDouble(),
                    height: banner!.size.height.toDouble(),
                    child: AdWidget(
                      ad: banner!,
                    ),
                  )
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ReusableChapter(
                          classID: 11,
                          chapterID: 1,
                          title: "Chapter 1",
                          level: '1001',
                          imageLocation: "img/11/ch1.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 1)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 2,
                          title: "Chapter 2",
                          level: '1002',
                          imageLocation: "img/11/ch2.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 2)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 3,
                          title: "Chapter 3",
                          level: '1003',
                          imageLocation: "img/11/ch3.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 3)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 4,
                          title: "Chapter 4",
                          level: '1004',
                          imageLocation: "img/11/ch4.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 4)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 5,
                          title: "Chapter 5",
                          level: '1005',
                          imageLocation: "img/11/ch5.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 5)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 6,
                          title: "Chapter 6",
                          level: '1006',
                          imageLocation: "img/11/ch6.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 6)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 7,
                          title: "Chapter 7",
                          level: '1007',
                          imageLocation: "img/11/ch7.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 7)),
                            );
                          }),
                      ReusableChapter(
                          classID: 11,
                          chapterID: 8,
                          title: "Chapter 8",
                          level: '1008',
                          imageLocation: "img/11/ch8.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChapterRead(11, 8)),
                            );
                          }),
                      Divider(
                        height: 20,
                      )
                    ],
                  ),
                ),
                if (banner == null)
                  SizedBox(
                    height: 0,
                  )
                else
                  Container(
                    height: 50,
                    child: AdWidget(
                      ad: banner!,
                    ),
                  )
              ],
            ),
    );
  }
}

class ReusableChapter extends StatelessWidget {
  late final VoidCallback onTap;
  late final String title;
  late final String imageLocation;
  late final int chapterID;
  late final int classID;
  late final String level;
  ReusableChapter(
      {required this.title,
      required this.imageLocation,
      required this.onTap,
      required this.chapterID,
      required this.classID,
      required this.level});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: AppInfo.currentAppColor,
              ),
            ),
            // Preview Widget
            Image.asset(
              imageLocation,
              width: double.infinity,
            ),
            //Desc

            // Last
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              //decoration: decoration,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  FlatButton.icon(
                    icon: Icon(
                      Icons.book,
                      color: AppInfo.currentAppColor,
                      size: 26,
                      //color: App.ACCENT_COLOR,
                    ),
                    label: Text(
                      'Quick Guide'.toUpperCase(),
                      style: TextStyle(
                          color: AppInfo.currentAppColor, fontSize: 16),
                    ),
                    onPressed: () {
                      if (chapterID == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 1)),
                        );
                      } else if (chapterID == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 2)),
                        );
                      } else if (chapterID == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 3)),
                        );
                      } else if (chapterID == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 4)),
                        );
                      } else if (chapterID == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 5)),
                        );
                      } else if (chapterID == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 6)),
                        );
                      } else if (chapterID == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 7)),
                        );
                      } else if (chapterID == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 1)),
                        );
                      } else if (chapterID == 8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 8)),
                        );
                      } else if (chapterID == 9) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterRead(classID, 9)),
                        );
                      }
                    },
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      Icons.video_library,
                      color: AppInfo.currentAppColor,
                      size: 26,
                      //color: App.ACCENT_COLOR,
                    ),
                    label: Text(
                      'Watch Video'.toUpperCase(),
                      style: TextStyle(
                          color: AppInfo.currentAppColor, fontSize: 16),
                    ),
                    onPressed: () {
                      {
                        if (classID == 11) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeveloperUI()),
                          );
                          return;
                        }
                        if (chapterID == 1) {
                          launch("https://youtu.be/yC6-jKyt9Kw");
                        } else if (chapterID == 2) {
                          launch("https://youtu.be/KOijFb9UaPg");
                        } else if (chapterID == 3) {
                          launch("https://youtu.be/DhxmoedO9ek");
                        } else if (chapterID == 4) {
                          launch("https://youtu.be/mPBXCCogexY");
                        } else if (chapterID == 5) {
                          launch("https://youtu.be/QSonEVhcp_c");
                        } else if (chapterID == 6) {
                          launch("https://youtu.be/hJuEC5epG6k");
                        } else if (chapterID == 7) {
                          launch("https://youtu.be/Q7xyhZxokts");
                        } else if (chapterID == 8) {
                          launch("https://youtu.be/h-LGwS4ZCHM");
                        } else if (chapterID == 9) {
                          launch("https://youtu.be/pHtmsIdsftw");
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeveloperUI()),
                          );
                        }
                      }
                    },
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  TextButton.icon(
                      icon: Icon(
                        Icons.play_arrow,
                        color: AppInfo.currentAppColor,
                        size: 26,
                      ),
                      label: Text(
                        'Play Quiz'.toUpperCase(),
                        style: TextStyle(
                            color: AppInfo.currentAppColor, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Quiz11(
                                      classname: classID,
                                      chapter: level,
                                    )));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
