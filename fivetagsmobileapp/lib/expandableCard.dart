import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:expandable/expandable.dart';

class ExCard extends StatelessWidget {
  var title;
  var description;
  ExCard(title, description) {
    this.title = title;
    this.description = description;
  }
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: Container(
                //color: blueLightSelected,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.0, -1.0),
                    end: Alignment(0.0, 1.0),
                    colors: [blueLightUnselected, blueLightSelected],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: ExpandablePanel(
                  collapsed: null,
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: blueDark,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  // collapsed: Text(
                  //   description,
                  //   style: TextStyle(
                  //     color: blueDark,
                  //   ),
                  //   softWrap: true,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            description,
                            style: TextStyle(
                              color: blueDark,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
