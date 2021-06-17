import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../decoration.dart';
import 'containerSimplo.dart';

class ContainerHalf extends StatelessWidget {
  final String title;
  final List<Map> data;
  final Widget obj;
  final double margin;

  const ContainerHalf({
    @required this.title,
    @required this.data,
    this.obj,
    this.margin = 10.0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: (MediaQuery.of(context).size.width - 60) / 2,
      decoration: Decoretion().gets(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          /*   Divider(
            color: Colors.white,
          ), */
          ...callDiv(),
        ],
      ),
    );
  }

  callDiv() {
    var divs = [];
    if (obj != null) {
      return obj;
    } else {
      data.forEach((el) {
        divs.add(
          ContainerSimplo(
            title: el['title'],
            text: el['value'] is int ? el['value'].toString() : el['value'],
          ),
        );
      });
      return divs;
    }
  }
}
