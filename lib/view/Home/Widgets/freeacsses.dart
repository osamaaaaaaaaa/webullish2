import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class freeacsses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Free Access For One Week',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff2C2C2E),
          ),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Free trial',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      '7 Day\'s',
                      style: TextStyle(color: Color(0xffBF5AF2), fontSize: 17),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.content_paste_go_outlined,
                    color: Color(0xffBF5AF2),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
