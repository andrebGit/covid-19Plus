import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:perguntas/decoration.dart';

class Div extends StatelessWidget {
  final String title;
  final Widget body;
  final double width;
  final double minWidth;
  final double heigth;
  final double minHeigth;
  Div({
    this.body,
    this.width = 0,
    this.heigth = 0,
    this.minWidth = 0,
    this.minHeigth = 0,
    this.title = '',
  });
  confirTitle() {
    return title.length == 0
        ? body
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Text(title),
              ),
              body,
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: confirTitle(),
      ),
      //
      constraints: BoxConstraints(
        minWidth: minWidth < 0 ? double.infinity : minWidth,
        maxWidth: width == 0 ? double.infinity : width,
        maxHeight: heigth == 0 ? double.infinity : heigth,
        minHeight: minHeigth < 0 ? double.infinity : minHeigth,
      ),
      //height: heigthx == 0 ? double.infinity : heigthx,
      decoration: Decoretion(bgColor: 900).gets(),
    );
  }
}
