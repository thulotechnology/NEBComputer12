import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neb_computer12/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Guide'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('img/thulotechnology.png'),
              ),
            ),
            Text(''),
            SizedBox(
              height: 10,
            ),
            Text(
              'Share this app to 20 friends to watch full video first.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FlatButton(
              color: Colors.red,
              child: Text(
                'Click here to share.',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () => shareApp(),
            ),
            // Text('Developed By: Thulo Technology Pvt.Ltd.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
            SizedBox(
              height: 30,
            ),
            // Center(child: Text('Thulo Technology is an initiative by Bishworaj Poudel, which works on software, website, app development, artificial-intelligence, machine learning, internet of things etc.',style: TextStyle(fontSize: 17),)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.youtube),
                  onPressed: () {
                    launch(
                        "https://www.youtube.com/channel/UCBzIcwOmMBBOCjQDVZ0pDmw/playlists");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {
                    launch("https://www.facebook.com/thulotechnology");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {
                    launch("https://www.instagram.com/bishworajpoudelofficial");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.twitter),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: null,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.web,
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'thulotechnology.com',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () => launch("http://thulotechnology.com"),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            'Bishworaj Poudel',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () => launch(
                              "https://www.facebook.com/bishworajpoudelofficial/"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.email,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                            child: FlatButton(
                          child: Text(
                            'Email: thulotechnology@gmail.com',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () => launch(
                              "mailto:thulotechnology@gmail.com?subject=Inquiry From App&body= Write your feedback here"),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
