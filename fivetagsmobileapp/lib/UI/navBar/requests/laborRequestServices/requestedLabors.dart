import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter/material.dart';

class RequestedLabors extends StatelessWidget {
  String type;
  RequestedLabors(type) {
    this.type = type;
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
                  child: Text(
                    'You requested $type',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: blueDark,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: Text(
                    'waiting for $type',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.yellow[800],
                        fontWeight: FontWeight.w900),
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
