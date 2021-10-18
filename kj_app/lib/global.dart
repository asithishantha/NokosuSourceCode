import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Global extends StatelessWidget {
  Global({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 15.5, end: 15.0),
          Pin(size: 12.2, middle: 0.5034),
          child: SvgPicture.string(
            _svg_n7wupe,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(start: 0.0, end: 0.0),
          child: Container(
            decoration: BoxDecoration(),
          ),
        ),
      ],
    );
  }
}

const String _svg_n7wupe =
    '<svg viewBox="15.5 13.5 21.5 12.2" ><path transform="translate(-886.82, -908.11)" d="M 902.322998046875 921.6141357421875 L 913.0555419921875 933.7964477539063 C 913.1408081054688 933.8932495117188 923.7881469726563 921.6141357421875 923.7881469726563 921.6141357421875" fill="none" stroke="#000000" stroke-width="5" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
