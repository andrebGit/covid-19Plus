import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/indexApp');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    // remove barra de notificação fullscreen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(
      // color: Colors.green,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/logo.png'),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.green),
                color: Colors.black45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'COVID-19 PLUS',
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                        //fontSize: ,
                      ),
                    ),
                    Text(
                      'Beta: 0.2',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),

      // new Image.asset('assets/splash.jpg', fit: BoxFit.fill),
    );
  }
}
