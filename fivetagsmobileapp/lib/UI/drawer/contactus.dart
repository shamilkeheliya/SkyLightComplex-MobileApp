import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _auth = FirebaseAuth.instance;
  CollectionReference contact =
      FirebaseFirestore.instance.collection('contactus');
  String name;
  String mobile;
  String msg;

  final _name = TextEditingController();
  final _mobile = TextEditingController();
  final _msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Contact Us',
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset(
                        'images/logo.png',
                        height: 140.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    child: Text(
                      'We are for you...',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: mainFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: TextField(
                      controller: _name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: blueLightSelected),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: TextField(
                      controller: _mobile,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        mobile = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contact Number',
                        labelStyle: TextStyle(color: blueLightSelected),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: TextField(
                      controller: _msg,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        msg = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Message',
                        labelStyle: TextStyle(color: blueLightSelected),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Hero(
                    tag: 'btn',
                    child: Container(
                      height: 50.0,
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
                      child: ElevatedButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: mainFont,
                          ),
                        ),
                        onPressed: () async {
                          if (_name.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Name cannot be blank'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else if (_mobile.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Contact Number cannot be blank'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else if (_msg.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Message cannot be blank'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            try {
                              contact
                                  .add({
                                    'name': name,
                                    'mobile': mobile,
                                    'message': msg,
                                    'read': false,
                                  })
                                  .then((value) => print("Message Added"))
                                  .catchError((error) =>
                                      print("Failed to add user: $error"));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('We will contact you!'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
