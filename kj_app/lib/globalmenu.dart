import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class globalmenu extends StatelessWidget {
  globalmenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(start: 0.0, end: 0.0),
          child: Container(
            decoration: BoxDecoration(),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 6.5, end: 6.5),
          Pin(size: 1.0, middle: 0.2692),
          child: SvgPicture.string(
            _svg_iljeg7,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 6.5, end: 6.5),
          Pin(size: 1.0, middle: 0.7717),
          child: SvgPicture.string(
            _svg_pcgf9,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 6.5, end: 6.5),
          Pin(size: 1.0, middle: 0.5205),
          child: SvgPicture.string(
            _svg_g3h0h,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

const String _svg_iljeg7 =
    '<svg viewBox="6.5 10.5 27.0 1.0" ><path transform="translate(6.5, 10.5)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="4" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_pcgf9 =
    '<svg viewBox="6.5 30.1 27.0 1.0" ><path transform="translate(6.5, 30.1)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="4" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_g3h0h =
    '<svg viewBox="6.5 20.3 27.0 1.0" ><path transform="translate(6.5, 20.3)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="4" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
