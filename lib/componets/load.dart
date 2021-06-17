import 'package:flutter/material.dart';

class PreLoad extends StatelessWidget {
  // const Load({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
        backgroundImage: AssetImage('assets/img/load_1.gif'),
        radius: 25.0,
      ),
    );
  }
}
