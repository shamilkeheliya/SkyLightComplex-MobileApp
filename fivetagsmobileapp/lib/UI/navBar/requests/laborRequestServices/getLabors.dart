import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GetLabors extends StatefulWidget {
  var document;

  GetLabors(document) {
    this.document = document;
  }

  @override
  _GetLaborsState createState() => _GetLaborsState(document);
}

class _GetLaborsState extends State<GetLabors> {
  var document;
  final _msg = TextEditingController();
  String msg = 'No message included';
  int rating = 3;
  double rt;
  int stars;
  int ratingCount;
  int thisRate;

  _GetLaborsState(document) {
    this.document = document;
  }

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('labors')
        .doc(document.data()['lid'])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        rt = documentSnapshot.data()['rating'];
        rating = rt.ceil();
        print(rating);
        stars = documentSnapshot.data()['stars'];
        ratingCount = documentSnapshot.data()['ratingCount'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 1.0, 4.0, 1.0),
      child: new Card(
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLightUnselected, blueLightSelected],
              stops: [0.0, 1.0],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          foregroundImage:
                              NetworkImage(document.data()['laborProfile']),
                          backgroundImage:
                              AssetImage('images/profilePicture.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  document.data()['laborName'],
                                  style: TextStyle(
                                    color: blueDark,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      document.data()['type'],
                                      style: TextStyle(
                                        color: blueMid,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(Icons.star_border),
                                    Text(
                                      '$rating',
                                      style: TextStyle(
                                        color: blueMid,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Text(
                                  document.data()['laborMobile'],
                                  style: TextStyle(
                                    color: blueMid,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: blueDark,
                          size: 30.0,
                        ),
                        onPressed: () {
                          FlutterPhoneState.startPhoneCall(
                              document.data()['laborMobile']);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: blueLightSelected,
                                title: Text(
                                  'Report ${document.data()['type']}',
                                  style: TextStyle(color: blueDark),
                                ),
                                content: Container(
                                  child: TextField(
                                    controller: _msg,
                                    style: TextStyle(
                                      color: blueDark,
                                    ),
                                    onChanged: (value) {
                                      msg = value;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Reason',
                                      labelStyle: TextStyle(color: blueDark),
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      CollectionReference report =
                                          FirebaseFirestore.instance
                                              .collection('laborRequests');
                                      report.doc(document.reference.id).update({
                                        'status': 'Reported',
                                        'reportMessage': msg,
                                      }).then(
                                        (value) {
                                          print("Reported");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Report added Successfully'),
                                              action: SnackBarAction(
                                                label: 'OK',
                                                onPressed: () {},
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      ).catchError(
                                          (error) => print("Failed: $error"));
                                    },
                                    child: const Text(
                                      'Report',
                                      style: TextStyle(color: blueDark),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Dismiss',
                                      style: TextStyle(color: blueDark),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.redAccent[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Report',
                                style: TextStyle(color: blueDark),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: blueLightSelected,
                                title: Text(
                                  'Rate ${document.data()['type']}',
                                  style: TextStyle(color: blueDark),
                                ),
                                content: Container(
                                  child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (Rating) {
                                      print(Rating);
                                      setState(() {
                                        thisRate = Rating.toInt();
                                      });
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      CollectionReference done =
                                          FirebaseFirestore.instance
                                              .collection('laborRequests');
                                      done.doc(document.reference.id).update({
                                        'status': 'Done',
                                        'rating': thisRate,
                                      }).then(
                                        (value) {
                                          CollectionReference labor =
                                              FirebaseFirestore.instance
                                                  .collection('labors');
                                          labor
                                              .doc(document.data()['lid'])
                                              .update({
                                            'stars': (stars + thisRate),
                                            'ratingCount': (ratingCount + 1),
                                            'rating': ((stars + thisRate) /
                                                (ratingCount + 1)),
                                          });

                                          print("Done");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Report added Successfully'),
                                              action: SnackBarAction(
                                                label: 'OK',
                                                onPressed: () {},
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      ).catchError(
                                          (error) => print("Failed: $error"));
                                    },
                                    child: const Text(
                                      'Done & Rate',
                                      style: TextStyle(color: blueDark),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Dismiss',
                                      style: TextStyle(color: blueDark),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(color: blueDark),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
