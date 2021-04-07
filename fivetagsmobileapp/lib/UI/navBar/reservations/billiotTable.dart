import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class BilliotTable extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<BilliotTable> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  final _auth = FirebaseAuth.instance;
  String name, profilePhoto, userid;
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
        profilePhoto = documentSnapshot.data()["profileURL"];
        name =
            '${documentSnapshot.data()["firstName"]} ${documentSnapshot.data()["lastName"]}';
      });
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
          'Billiot Table Reservation',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Hero(
                tag: 'billiot',
                child: Icon(
                  Icons.sports_soccer,
                  size: 100.0,
                  color: blueMid,
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'Billiot Table',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: ElevatedButton(
                child: Text(
                  "${selectedDate}".split(' ')[0],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
                onPressed: () => _selectDate(context),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Container(
                child: Text(
                  'Select a date for the reservation',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: blueLightSelected,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: ElevatedButton(
                child: Text(
                  "${selectedTime.format(context)}",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
                onPressed: () async {
                  // TimeOfDay Time = await showTimePicker(
                  //   context: context,
                  //   initialTime: TimeOfDay.now(),
                  //   builder: (BuildContext context, Widget child) {
                  //     return MediaQuery(
                  //       data: MediaQuery.of(context)
                  //           .copyWith(alwaysUse24HourFormat: true),
                  //       child: child,
                  //     );
                  //   },
                  // );
                  final DateTime now = DateTime.now();
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
                  ).then((TimeOfDay value) {
                    if (value != null) {
                      setState(() {
                        selectedTime = value;
                      });
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Container(
                child: Text(
                  'Select a time for the reservation',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: blueLightSelected,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: ElevatedButton(
                child: Text(
                  'Reserve',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
                onPressed: () {
                  var h;
                  var m;
                  if (selectedTime.hour < 10) {
                    h = "0${selectedTime.hour}";
                  } else {
                    h = "${selectedTime.hour}";
                  }

                  if (selectedTime.minute < 10) {
                    m = "0${selectedTime.minute}";
                  } else {
                    m = "${selectedTime.minute}";
                  }

                  String time = "${h}:${m}";
                  String date =
                      "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";

                  CollectionReference bookings =
                      FirebaseFirestore.instance.collection('bookings');
                  bookings.add({
                    'uid': userid,
                    'userName': name,
                    'userProfile': profilePhoto,
                    'date': date,
                    'time': time,
                    'type': 'Billiot Table',
                    'read': false,
                    'addedDateTime': DateTime.now(),
                  }).then(
                    (value) {
                      print("Reservation Added");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reservation added Successfully'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ).catchError((error) => print("Failed: $error"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
