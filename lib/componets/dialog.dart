import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  final String title;
  final Widget body;

  const Dialogs({
    @required this.title,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      scrollable: true,
      elevation: 0,

      /*  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ), */

      //title: Text(title),
      content: bodyAll(context),
    );
  }

  bodyAll(context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              body,
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                color: Colors.black,
                icon: Icon(
                  Icons.close_sharp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
