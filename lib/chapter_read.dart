import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:neb_computer12/Chapter.dart';
import 'package:neb_computer12/main.dart';
import 'package:provider/provider.dart';

import 'ad_state.dart';

class ChapterRead extends StatefulWidget {
  final int chapterId;
  final int classid;
  ChapterRead(this.classid, this.chapterId);
  @override
  _ChapterReadState createState() => _ChapterReadState();
}

class _ChapterReadState extends State<ChapterRead> {
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

  List bab(int chapterid, int classid) {
    if (classid == 12) {
      switch (chapterid) {
        case 1:
          return _chapter1.map(_buildItem).toList();
        case 2:
          return _chapter2.map(_buildItem).toList();
        case 3:
          return _chapter3.map(_buildItem).toList();
        case 4:
          return _chapter4.map(_buildItem).toList();

        case 5:
          return _chapter5.map(_buildItem).toList();

        case 6:
          return _chapter6.map(_buildItem).toList();
        case 7:
          return _chapter7.map(_buildItem).toList();

        default:
          return _chapter7.map(_buildItem).toList();
      }
    } else {
      switch (chapterid) {
        case 1:
          return __chapter1.map(_buildItem).toList();

        case 2:
          return __chapter2.map(_buildItem).toList();

        case 3:
          return __chapter3.map(_buildItem).toList();
        case 4:
          return __chapter4.map(_buildItem).toList();

        case 5:
          return __chapter5.map(_buildItem).toList();

        case 6:
          return __chapter6.map(_buildItem).toList();
        case 7:
          return __chapter7.map(_buildItem).toList();

        case 8:
          return __chapter8.map(_buildItem).toList();

        default:
          return __chapter8.map(_buildItem).toList();
      }
    }
  }

  BannerAd? banner;
  InterstitialAd? iAdd;
  void loadIntrerestAd() async {
    final adState = Provider.of<AdState>(context);
    await InterstitialAd.load(
      adUnitId: adState.interstitialAdUnitID,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            iAdd = ad;
            iAdd!.show();
          },
          onAdFailedToLoad: (_) {}),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            adUnitId: adState.bannerAdUnitID,
            size: AdSize.largeBanner,
            request: AdRequest(),
            listener: BannerAdListener())
          ..load();
      });
    });
    var rng = new Random();
    var r = rng.nextInt(2);
    if (r == 1) {
      loadIntrerestAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter ${widget.chapterId}'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          return;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: bab(widget.chapterId, widget.classid) as List<Widget>,
              ),
            ),
            if (banner == null)
              SizedBox()
            else
              Container(
                width: banner!.size.width.toDouble(),
                height: banner!.size.height.toDouble() + 10,
                child: AdWidget(
                  ad: banner!,
                ),
              )
          ],
        ),
      ),
    );
  }
}

Widget _buildItem(Chapter e) {
  return Card(
    elevation: 2.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: AppInfo.currentAppColor,
          foregroundColor: Colors.white,
          child: Text(e.questionno.toString()),
        ),
        initiallyExpanded: false,
        title: Text(
          e.question,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Text(
              e.answer,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    ),
  );
}
