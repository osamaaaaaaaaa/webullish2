import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webullishappnew/Model/performanceModel.dart';

class performanceController extends GetxController {
  performanceController() {}
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<performanceModel> performancelist = [];
  getperformance(title) async {
    performancelist.clear();
    db
        .collection('performance')
        .doc(title)
        .collection(title)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return;
      }
      for (int i = 0; i < value.docs.length; i++) {
        performancelist.add(performanceModel.fromjson(value.docs[i].data()));
      }
      print('${performancelist.length.toString()}hh');
      update();
    });
    update();
  }

  test(title) async {
    db
        .collection('performance')
        .doc(title)
        .collection(title)
        .add(performanceModel(
          symbol: 'CTEK',
          plreached: '15-35%	',
          pltarget: '34%	',
          comment: 'Reached several targets',
        ).tojson());
    print('done');
  }
}
