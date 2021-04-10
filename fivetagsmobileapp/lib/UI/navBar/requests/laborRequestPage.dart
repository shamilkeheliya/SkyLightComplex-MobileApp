import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class LaborRequestsPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LaborRequestsPage> {
  final _auth = FirebaseAuth.instance;
  String userName, userid, userProfile, userMobile;
  int keyNum;
  @override
  void initState() {
    super.initState();
    final User user = _auth.currentUser;
    final uid = user.uid;
    userid = uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        userName =
            '${documentSnapshot.data()["firstName"]} ${documentSnapshot.data()["lastName"]}';
        keyNum = documentSnapshot.data()["keyNum"];
        userProfile = documentSnapshot.data()["profileURL"];
        userMobile = documentSnapshot.data()["mobile"];
      });
    });
  }

  Color elecricianBackColor = blueLightSelected;
  Color plumberBackColor = blueLightSelected;
  Color servantBackColor = blueLightSelected;
  Color cleanerBackColor = blueLightSelected;
  Color elecricianFontColor = blueDark;
  Color plumberFontColor = blueDark;
  Color servantFontColor = blueDark;
  Color cleanerFontColor = blueDark;
  String value;

  void electricain() {
    setState(() {
      elecricianBackColor = blueLightUnselected;
      elecricianFontColor = Colors.white;
      plumberUnselect();
      servantUnselect();
      cleanerUnselect();
      value = 'Electrician';
    });
  }

  void plumber() {
    setState(() {
      plumberBackColor = blueLightUnselected;
      plumberFontColor = Colors.white;
      electricainUnselect();
      servantUnselect();
      cleanerUnselect();
      value = 'Plumber';
    });
  }

  void servant() {
    setState(() {
      servantBackColor = blueLightUnselected;
      servantFontColor = Colors.white;
      electricainUnselect();
      plumberUnselect();
      cleanerUnselect();
      value = 'Servant';
    });
  }

  void cleaner() {
    setState(() {
      cleanerBackColor = blueLightUnselected;
      cleanerFontColor = Colors.white;
      electricainUnselect();
      plumberUnselect();
      servantUnselect();
      value = 'House Cleaner';
    });
  }

  void electricainUnselect() {
    setState(() {
      elecricianBackColor = blueLightSelected;
      elecricianFontColor = blueDark;
    });
  }

  void plumberUnselect() {
    setState(() {
      plumberBackColor = blueLightSelected;
      plumberFontColor = blueDark;
    });
  }

  void servantUnselect() {
    setState(() {
      servantBackColor = blueLightSelected;
      servantFontColor = blueDark;
    });
  }

  void cleanerUnselect() {
    setState(() {
      cleanerBackColor = blueLightSelected;
      cleanerFontColor = blueDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Request Labor',
          style: TextStyle(
            fontFamily: mainFont,
            color: blueMid,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [blueLight, blueDark],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      btn(Icons.bolt, 'Electrician', electricain,
                          elecricianFontColor, elecricianBackColor),
                      btn(Icons.water_damage_outlined, 'Plumber', plumber,
                          plumberFontColor, plumberBackColor),
                    ],
                  ),
                  Row(
                    children: [
                      btn(Icons.person, 'Servant', servant, servantFontColor,
                          servantBackColor),
                      btn(Icons.cleaning_services, 'House Cleaner', cleaner,
                          cleanerFontColor, cleanerBackColor),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: Container(
                height: 100.0,
                child: ElevatedButton(
                  child: Text(
                    'Request Labor',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: blueDark,
                      fontFamily: mainFont,
                    ),
                  ),
                  onPressed: () async {
                    if (value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select one of labor'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: blueLightSelected,
                          title: Text(
                            'Request $value',
                            style: TextStyle(color: blueDark),
                          ),
                          content: const Text(
                            'Are you sure?',
                            style: TextStyle(color: blueDark),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                CollectionReference laborRequests =
                                    FirebaseFirestore.instance
                                        .collection('laborRequests');
                                laborRequests.add({
                                  'uid': userid,
                                  'userName': userName,
                                  'userKeyNum': keyNum,
                                  'userProfile': userProfile,
                                  'userMobile': userMobile,
                                  'type': value,
                                  'status': 'Request',
                                  'addedDateTime': DateTime.now(),
                                }).then(
                                  (value) {
                                    print("Request Added");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Request added Successfully'),
                                        action: SnackBarAction(
                                          label: 'OK',
                                          onPressed: () {},
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ).catchError(
                                    (error) => print("Failed: $error"));
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(color: blueDark),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'No',
                                style: TextStyle(color: blueDark),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded btn(icon, title, function, fontColor, backColor) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLightUnselected, backColor],
              stops: [0.0, 1.0],
            ),
          ),
          child: FlatButton(
            //color: blueLightSelected,
            onPressed: () {
              function();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    icon,
                    color: fontColor,
                    size: 50.0,
                  ),
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: fontColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: mainFont),
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
