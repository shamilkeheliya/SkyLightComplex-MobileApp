import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class ReportedLabors extends StatelessWidget {
  var document;
  ReportedLabors(document) {
    this.document = document;
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
                                    Text(
                                      'Reported',
                                      style: TextStyle(
                                        color: Colors.red[800],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
