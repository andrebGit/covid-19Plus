import 'package:flutter/material.dart';
import 'package:perguntas/componets/load.dart';

// import 'containerHalf.dart';
import 'div.dart';

class AvatarInfo extends StatelessWidget {
  final bool load;
  final String img;
  final String title;
  final List data;

  const AvatarInfo({
    Key key,
    this.load = false,
    @required this.img,
    @required this.title,
    this.data,
  });
  // const avatarInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 7.0,
        right: 7.0,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 55.0,
            ),
            child: Div(
              minHeigth: 370,
              minWidth: -1,
              body: Column(
                children: [
                  /* Row(
                    children: [Text('ok')],
                  ), */
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60.0,
                      bottom: 15.0,
                    ),
                    child: Text(
                      // Text in title
                      title,
                      style: TextStyle(
                        //color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...call(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///Image Avatar
          Container(
            width: 200.0,
            height: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                  offset: Offset(0.0, 3.0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // Imagem
                      image: AssetImage(img),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  call() {
    if (load) {
      return [
        PreLoad(),
      ];
    } else {
      return data;
    }
  }
}
