import 'package:flutter/material.dart';
import 'package:perguntas/decoration.dart';

class ScrollHorizontCard extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  final List<dynamic> body;

  ScrollHorizontCard({
    @required this.body,
  });

  @override
  _ScrollHorizontCardState createState() => _ScrollHorizontCardState();
}

class _ScrollHorizontCardState extends State<ScrollHorizontCard> {
  var _correntIndex = 0;
  final PageController controller = PageController(viewportFraction: 0.8);
  bool activ;
  double top;
  @override
  void initState() {
    controller.addListener(() {
      int next = controller.page.round();
      if (_correntIndex != next) {
        setState(() {
          _correntIndex = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 200.0,
      width: 360.0,
      decoration: Decoretion(bgColor: 900).gets(),
      child: PageView.builder(
        controller: controller,
        itemCount: widget.body.length,
        itemBuilder: (_, currentindex) {
          activ = (currentindex == _correntIndex);
          top = activ ? 0.0 : 30.0;
          Object border = activ
              ? Colors.blueGrey[200].withOpacity(0.5)
              : Colors.transparent;

          return AnimatedContainer(
            margin: EdgeInsets.only(top: top, left: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(2.0),
            duration: Duration(milliseconds: 500),
            color: Color(0Xff212121),
            /* decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: border,
            ), */
            child: cont(currentindex),
          );
        },
      ),
    );

    /* SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ...body,
        ],
      ),
    ); */
  }

  Widget cont(currentindex) {
    return widget.body[currentindex];
    /* Container(
      child: widget.body[currentindex],
    ); */
  }
}
