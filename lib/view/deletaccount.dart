import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class deleteacc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                '''Would you like to delete your account with us!

Please send us your username, email, in the subject line "I would like to delete my account''',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                Uri url = Uri.parse('mailto:Support@webullish.com');
                if (await canLaunchUrl(url))
                  await launchUrl(
                    url,
                  );
              },
              child: Icon(
                Icons.email,
                size: 60,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                '''In the event that you request deletion of your account, you will not be able to request the recovery of your account with us, you agree to that!''',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      )),
    );
  }
}
