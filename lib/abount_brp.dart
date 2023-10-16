import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBishworajUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("NEB Computer [11 and 12]"),
            content: new Text(
                "App Developed By:\nBishworaj Poudel\nWebsite: brp.com.np\nEmail: iambrp.tech@gmail.com\n\nSpecial Support: Bhupendra Gautam, \nBijayraj Poudel, \nBijendra Pasi, \nSushil Sigdel, \nSushil Garbuja, \nPrem Raj Dhungana, \nSandeep Poudel, \nAshan Thapa, \nKishor Bahadur Giri, \nAmrit Dahal & \nJayu Purja Pun."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('About Bishworaj Poudel'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: _showDialog,
        ),
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('img/brp.jpg'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Founder/ CEO',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FlatButton(
              color: Colors.green,
              child: Text(
                'Thulo Technology Pvt.Ltd.',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () => launch("https://thulotechnology.com"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Bishworaj Poudel is the name of a tech personality of his generation who loves helping people to understand new concepts and giving them tools to help them excel in their passion.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'To Know More, Stay Connected,',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //  Center(child: Text('Thulo Technology is an initiative by Bishworaj Poudel, which works on software, website, app development, artificial-intelligence, machine learning, internet of things etc.',style: TextStyle(fontSize: 17),)),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.youtube),
                  onPressed: () {
                    launch(
                        "https://www.youtube.com/channel/technologychannel/playlists");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {
                    launch("https://www.facebook.com/bishworajpoudelofficial");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {
                    launch("https://www.instagram.com/bishworajpoudelofficial");
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.chrome),
                  onPressed: () {
                    launch("https://brp.com.np");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
