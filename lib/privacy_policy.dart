import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                'Privacy is a fundamental right and has become a hot topic with the rise of the digital age, with people knowingly, and sometimes unknowingly, sharing a large quantity of personal information online.Your privacy is very important to us. To better protect your privacy we provide this notice explaining our online information practices and the choices you can make about the way your information is collected and used. We may use third-party advertising companies to serve ads when you visit our app. If you have any questions please let us know at thulotechnology@gmail.com')
          ],
        ),
      ),
    );
  }
}
