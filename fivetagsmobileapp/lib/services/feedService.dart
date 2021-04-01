import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';

class FeedService {
  final CollectionReference feedList =
      FirebaseFirestore.instance.collection('bookings');

  Future getFeed() async {
    List itemsList = [];

    try {
      await feedList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
    } catch (e) {
      print(e);
      return null;
    }
  }
}
