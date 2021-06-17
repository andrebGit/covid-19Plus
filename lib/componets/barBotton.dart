import 'package:flutter/material.dart';
import 'package:perguntas/pages/whoWeEre.dart';

import 'dialog.dart';

class BarBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        //color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            //
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () =>
                      openDialog(body: '', title: '', context: context),
                  tooltip: 'Open navigation menu',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openDialog({title, body, context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogs(
          title: 'Quem somos',
          body: WhoWeAre(),
        );
      },
    );
  }
}
