import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:webullishappnew/view/videoplayer.dart';

class customer_ads extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return customer_adss();
  }
}

class customer_adss extends State<customer_ads> {
  double dot = 0;
  List<adsModel> adsList = [];
  getadscontainer() async {
    await FirebaseFirestore.instance
        .collection('videos_images')
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return;
      }
      for (int i = 0; i < value.docs.length; i++) {
        setState(() {
          adsList.add(adsModel.adsfromjson(value.docs[i].data()));
        });
      }
    });
  }

  @override
  void initState() {
    getadscontainer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 2,
                )
              ]),
          alignment: Alignment.center,
          margin: EdgeInsets.all(15),
          height: 280,
          child: adsList == null
              ? CircularProgressIndicator()
              : PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      dot = value.toDouble();
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: adsList.length,
                  itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              child: Container(
                                margin: EdgeInsets.all(7),
                                child: adsList[index].type == 'video'
                                    ? Container(
                                        height: 240,
                                        child: VideoApp(
                                          link: adsList[index].image,
                                        ))
                                    : ClipRRect(
                                        child: Image.network(
                                          adsList[index].image,
                                        ),
                                      ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                adsList[index].title,
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )),
        ),
        new DotsIndicator(
          dotsCount: adsList.isEmpty ? 1 : adsList.length,
          position: dot,
          decorator: DotsDecorator(
            color: Colors.black,
            // Inactive color
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class adsModel {
  late String link, image, desc, type, title;
  adsModel.adsfromjson(Map<dynamic, dynamic> map) {
    image = map['image'];
    title = map['title'];

    type = map['type'];
  }
}
