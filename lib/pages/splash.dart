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
      height: double.infinity,
      color: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
<<<<<<< HEAD
            width: 200.0,
=======
            width: 200,
>>>>>>> 8b1ace6485fab8460e0deea9a845bdaf7ecb8355
            image: AssetImage('assets/img/logo.png'),
            fit: BoxFit.cover,
          ),
          Text(
            'COVID-19 PLUS',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'v: Beta 0.2',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              decoration: TextDecoration.none,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      // new Image.asset('assets/splash.jpg', fit: BoxFit.fill),
    );
  }
}
