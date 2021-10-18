import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalLight_Button extends StatelessWidget {
  GlobalLight_Button({
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              color: const Color(0xff6fea90),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000),
                  offset: Offset(0, 3),
                  blurRadius: 7,
                ),
              ],
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 21.2, middle: 0.5),
          Pin(start: 14.3, end: 12.4),
          child:
              // Adobe XD layer: 'Icon awesome-lightb…' (shape)
              SvgPicture.string(
            _svg_h4e2p,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 14.0, middle: 0.4771),
          Pin(size: 14.0, middle: 0.3591),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              color: const Color(0xffffffff),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 5.9, middle: 0.5),
          Pin(size: 5.9, middle: 0.4428),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(size: 1.0, middle: 0.6031),
                child: SvgPicture.string(
                  _svg_mggjok,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 1.0, middle: 0.6031),
                Pin(start: 0.0, end: 0.0),
                child: SvgPicture.string(
                  _svg_lzoo62,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const String _svg_h4e2p =
    '<svg viewBox="17.9 14.3 21.2 30.2" ><path transform="translate(17.9, 14.34)" d="M 5.782845020294189 26.8127269744873 C 5.783447265625 27.18392181396484 5.895420074462891 27.54744338989258 6.10551929473877 27.85667419433594 L 7.134343147277832 29.37272834777832 C 7.491301536560059 29.89909744262695 8.093297004699707 30.21542739868164 8.738079071044922 30.21543502807617 L 12.45304393768311 30.21543884277344 C 13.09779739379883 30.21543502807617 13.69979858398438 29.89911651611328 14.05676555633545 29.37275123596191 L 15.08560562133789 27.85667419433594 C 15.29561424255371 27.54739761352539 15.40785789489746 27.18425178527832 15.40827941894531 26.8127269744873 L 15.41068840026855 24.54956245422363 L 5.779835224151611 24.54956245422363 L 5.782845497131348 26.8127269744873 Z M 0 10.38634777069092 C 0 13.0047721862793 0.9902957081794739 15.39363479614258 2.622327327728271 17.21891975402832 C 3.616836786270142 18.33132171630859 5.172414302825928 20.65526962280273 5.765387535095215 22.61569595336914 C 5.767795562744141 22.63104057312012 5.769601821899414 22.64638328552246 5.77200984954834 22.6617259979248 L 15.41851425170898 22.6617259979248 C 15.42092227935791 22.64638328552246 15.42272758483887 22.63162994384766 15.42513561248779 22.61569595336914 C 16.01810836791992 20.65526962280273 17.57368469238281 18.33132171630859 18.56819534301758 17.21891975402832 C 20.20022773742676 15.39363479614258 21.19052124023438 13.0047721862793 21.19052124023438 10.38634777069092 C 21.19052124023438 4.639033794403076 16.42927551269531 -0.01771351881325245 10.56215190887451 -9.501740350970067e-06 C 4.42111349105835 0.01828465238213539 0 4.896331310272217 0 10.38634777069092 Z M 10.59526062011719 5.665276050567627 C 7.939823627471924 5.665276050567627 5.779232978820801 7.783267021179199 5.779232978820801 10.38634777069092 C 5.779232978820801 10.90802669525146 5.348198890686035 11.33056259155273 4.816027641296387 11.33056259155273 C 4.283856868743896 11.33056259155273 3.852822303771973 10.90802669525146 3.852822303771973 10.38634777069092 C 3.852822303771973 6.74168062210083 6.877287864685059 3.776848077774048 10.59526062011719 3.776848077774048 C 11.12743186950684 3.776848077774048 11.5584659576416 4.199383735656738 11.5584659576416 4.721062660217285 C 11.5584659576416 5.242740631103516 11.12743186950684 5.665276050567627 10.59526062011719 5.665276050567627 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mggjok =
    '<svg viewBox="0.0 2.9 5.9 1.0" ><path transform="translate(0.0, 2.93)" d="M 0 0 L 5.8502197265625 0" fill="none" stroke="#6fea90" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_lzoo62 =
    '<svg viewBox="2.9 0.0 1.0 5.9" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 2.93, 0.0)" d="M 0 0 L 5.8502197265625 0" fill="none" stroke="#6fea90" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
