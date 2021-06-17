import 'package:flutter/material.dart';

class Decoretion {
  final int bgColor;
  Decoretion({this.bgColor = 850});

  Object gets() {
    return BoxDecoration(
      color: Colors.grey[bgColor],
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          // color: Colors.white.withOpacity(0.5),
          color: Colors.blueGrey[200].withOpacity(0.5),
          blurRadius: 5.0,
          spreadRadius: -2.0,
          offset: Offset(-3.0, -3.0),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 1.0,
          spreadRadius: 2.0,
          offset: Offset(3.0, 3.0),
        ),
      ],
    );
  }
}
/* class Decoretion extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            // color: Colors.white.withOpacity(0.5),
            color: Colors.blueGrey[200].withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: -2.0,
            offset: Offset(-3.0, -3.0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1.0,
            spreadRadius: 2.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
      );
  }
} */