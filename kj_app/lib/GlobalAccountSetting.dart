import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:kjapp/controllers/Login_Controller.dart';
import 'package:kjapp/login_page.dart';
import 'package:provider/provider.dart';
import 'GlobalGallery.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalAccountSetting extends StatelessWidget {
  GlobalAccountSetting({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LoginPage(),
        )
      ],
      child: MaterialApp(
        title: 'sdffff Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }

  // return MaterialApp(
  //   home: LoginPage(),
  // );
  // return Scaffold(
  //   backgroundColor: const Color(0xffffffff),
  //   body: Stack(
  //     children: <Widget>[
  //       Pinned.fromPins(
  //         Pin(size: 19.2, end: 44.2),
  //         Pin(size: 13.7, start: 14.8),
  //         child:
  //             // Adobe XD layer: 'Icon ionic-ios-wifi' (group)
  //             Stack(
  //           children: <Widget>[
  //             Pinned.fromPins(
  //               Pin(start: 0.0, end: 0.0),
  //               Pin(size: 5.6, start: 0.0),
  //               child: SvgPicture.string(
  //                 _svg_q77pp7,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             Pinned.fromPins(
  //               Pin(start: 3.4, end: 3.4),
  //               Pin(size: 4.2, middle: 0.5165),
  //               child: SvgPicture.string(
  //                 _svg_fohmf,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             Pinned.fromPins(
  //               Pin(size: 5.3, middle: 0.4997),
  //               Pin(size: 3.9, end: 0.0),
  //               child: SvgPicture.string(
  //                 _svg_kvwhkd,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 22.6, end: 14.0),
  //         Pin(size: 10.5, start: 18.0),
  //         child:
  //             // Adobe XD layer: 'Icon ionic-ios-batt…' (group)
  //             Stack(
  //           children: <Widget>[
  //             Pinned.fromPins(
  //               Pin(start: 0.0, end: 2.4),
  //               Pin(start: 0.0, end: 0.0),
  //               child: SvgPicture.string(
  //                 _svg_adycc,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             Pinned.fromPins(
  //               Pin(size: 1.5, end: 0.0),
  //               Pin(size: 4.8, middle: 0.5),
  //               child: SvgPicture.string(
  //                 _svg_x9ig9m,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             Pinned.fromPins(
  //               Pin(size: 15.6, start: 2.3),
  //               Pin(start: 2.3, end: 2.3),
  //               child: SvgPicture.string(
  //                 _svg_gk6p09,
  //                 allowDrawingOutsideViewBox: true,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 41.0, start: 24.0),
  //         Pin(size: 21.0, start: 13.0),
  //         child: Text(
  //           '14:03',
  //           style: TextStyle(
  //             fontFamily: 'Noto Serif Myanmar',
  //             fontSize: 16,
  //             color: const Color(0xff000000),
  //             fontWeight: FontWeight.w700,
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(start: 72.5, end: 72.5),
  //         Pin(size: 1.0, middle: 0.4328),
  //         child: SvgPicture.string(
  //           _svg_utuf8x,
  //           allowDrawingOutsideViewBox: true,
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(start: 72.5, end: 72.5),
  //         Pin(size: 1.0, middle: 0.5684),
  //         child: SvgPicture.string(
  //           _svg_ezz0pd,
  //           allowDrawingOutsideViewBox: true,
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(start: 72.5, end: 72.5),
  //         Pin(size: 1.0, middle: 0.5006),
  //         child: SvgPicture.string(
  //           _svg_kt315d,
  //           allowDrawingOutsideViewBox: true,
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 68.0, middle: 0.5016),
  //         Pin(size: 24.0, middle: 0.4975),
  //         child: Text(
  //           'Mail address\n',
  //           style: TextStyle(
  //             fontFamily: 'Arial Rounded MT Bold',
  //             fontSize: 11,
  //             color: const Color(0xffd9d9d9),
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 53.0, middle: 0.5031),
  //         Pin(size: 12.0, middle: 0.5588),
  //         child: Text(
  //           'Password',
  //           style: TextStyle(
  //             fontFamily: 'Arial Rounded MT Bold',
  //             fontSize: 11,
  //             color: const Color(0xffd9d9d9),
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 31.0, middle: 0.5),
  //         Pin(size: 12.0, middle: 0.4213),
  //         child: Text(
  //           'Name',
  //           style: TextStyle(
  //             fontFamily: 'Arial Rounded MT Bold',
  //             fontSize: 11,
  //             color: const Color(0xffd9d9d9),
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(start: 85.0, end: 85.0),
  //         Pin(size: 32.0, middle: 0.8192),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(4.0),
  //             color: const Color(0xffffffff),
  //             border: Border.all(width: 1.0, color: const Color(0xff707070)),
  //           ),
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 76.0, middle: 0.5017),
  //         Pin(size: 76.0, start: 121.0),
  //         child: Stack(
  //           children: <Widget>[
  //             Pinned.fromPins(
  //               Pin(start: 0.0, end: 0.0),
  //               Pin(start: 0.0, end: 0.0),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(28.0),
  //                   color: const Color(0xfff5f4f4),
  //                 ),
  //               ),
  //             ),
  //             Pinned.fromPins(
  //               Pin(size: 33.0, middle: 0.3721),
  //               Pin(size: 15.0, middle: 0.5082),
  //               child: Text(
  //                 'アイコン',
  //                 style: TextStyle(
  //                   fontFamily: 'Arial Rounded MT Bold',
  //                   fontSize: 11,
  //                   color: const Color(0xff554949),
  //                 ),
  //                 textAlign: TextAlign.left,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 70.0, middle: 0.5016),
  //         Pin(size: 12.0, middle: 0.8113),
  //         child: Text(
  //           'New account',
  //           style: TextStyle(
  //             fontFamily: 'Arial Rounded MT Bold',
  //             fontSize: 11,
  //             color: const Color(0xff554949),
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(start: 85.0, end: 85.0),
  //         Pin(size: 32.0, middle: 0.7654),
  //         child: PageLink(
  //           links: [
  //             PageLinkInfo(
  //               transition: LinkTransition.Fade,
  //               ease: Curves.easeOut,
  //               duration: 0.3,
  //               pageBuilder: () => globalgallery(),
  //             ),
  //           ],
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(4.0),
  //               color: const Color(0xff6fea90),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Pinned.fromPins(
  //         Pin(size: 33.0, middle: 0.5),
  //         Pin(size: 12.0, middle: 0.7588),
  //         child: Text(
  //           'Log In',
  //           style: TextStyle(
  //             fontFamily: 'Arial Rounded MT Bold',
  //             fontSize: 11,
  //             color: const Color(0xff554949),
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}

const String _svg_q77pp7 =
    '<svg viewBox="2.2 6.8 19.2 5.6" ><path  d="M 11.84266948699951 6.75 C 8.351956367492676 6.75 4.861242771148682 8.189116477966309 2.35563850402832 10.53196239471436 C 2.214296817779541 10.66045570373535 2.210013866424561 10.87889194488525 2.3427894115448 11.02023506164551 L 3.486372709274292 12.21521472930908 C 3.61914849281311 12.3565559387207 3.84186863899231 12.36083984375 3.983210802078247 12.22806262969971 C 4.981168746948242 11.30291652679443 6.120469570159912 10.56622791290283 7.379696369171143 10.0436897277832 C 8.793113708496094 9.452625274658203 10.29647636413574 9.157092094421387 11.84695243835449 9.157092094421387 C 13.39742851257324 9.157092094421387 14.90079116821289 9.456908226013184 16.314208984375 10.0436897277832 C 17.57343482971191 10.5705099105835 18.71273612976074 11.30291652679443 19.710693359375 12.22806262969971 C 19.85203552246094 12.36083984375 20.07475662231445 12.3565559387207 20.2075309753418 12.21521472930908 L 21.35111427307129 11.02023506164551 C 21.48388862609863 10.88317584991455 21.47960472106934 10.66473865509033 21.33826446533203 10.53196239471436 C 18.8240966796875 8.189116477966309 15.33338356018066 6.75 11.84266948699951 6.75 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fohmf =
    '<svg viewBox="5.6 11.7 12.4 4.2" ><path transform="translate(-2.17, -3.17)" d="M 7.892716407775879 17.68968391418457 L 9.117679595947266 18.90179634094238 C 9.250453948974609 19.03028869628906 9.460325241088867 19.03885459899902 9.597384452819824 18.91464614868164 C 10.80949687957764 17.83959197998047 12.36425590515137 17.24852752685547 14.00467777252197 17.24852752685547 C 15.64510059356689 17.24852752685547 17.19985771179199 17.83530807495117 18.4119701385498 18.91464614868164 C 18.54903030395508 19.03885459899902 18.7588996887207 19.03028869628906 18.89167785644531 18.90179634094238 L 20.11663627624512 17.68968391418457 C 20.25797843933105 17.54834365844727 20.25369834899902 17.32133865356445 20.10378837585449 17.18856239318848 C 18.49763298034668 15.73659706115723 16.351806640625 14.84999847412109 14.00039577484131 14.84999847412109 C 11.64898300170898 14.84999847412109 9.503158569335938 15.73659706115723 7.897001266479492 17.18856239318848 C 7.755658149719238 17.32133865356445 7.751375198364258 17.54834365844727 7.892716407775879 17.68968391418457 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kvwhkd =
    '<svg viewBox="9.2 16.5 5.3 3.9" ><path transform="translate(-4.46, -6.27)" d="M 16.30743408203125 22.79531478881836 C 15.3051929473877 22.79531478881836 14.39717864990234 23.21505355834961 13.76328277587891 23.88749694824219 C 13.63479042053223 24.02455902099609 13.63907432556152 24.23442840576172 13.77184867858887 24.36720657348633 L 16.05901718139648 26.6243896484375 C 16.19607543945313 26.76144790649414 16.41879463195801 26.76144790649414 16.55585479736328 26.6243896484375 L 18.84302139282227 24.36720657348633 C 18.97579765319824 24.23442840576172 18.98008155822754 24.02455902099609 18.85158729553223 23.88749694824219 C 18.21768951416016 23.21933746337891 17.30967712402344 22.79531478881836 16.30743408203125 22.79531478881836 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_adycc =
    '<svg viewBox="1.1 10.1 20.1 10.5" ><path  d="M 19.01212882995605 10.125 L 3.384426832199097 10.125 C 2.141741991043091 10.125 1.125 11.14174175262451 1.125 12.38442611694336 L 1.125 18.40956497192383 C 1.125 19.65225028991699 2.141741991043091 20.66899108886719 3.384426832199097 20.66899108886719 L 19.01212882995605 20.66899108886719 C 20.25481414794922 20.66899108886719 21.27155494689941 19.65225028991699 21.27155494689941 18.40956497192383 L 21.27155494689941 12.38442611694336 C 21.27155494689941 11.14174175262451 20.25481414794922 10.125 19.01212882995605 10.125 Z M 19.95355606079102 18.40956497192383 C 19.95355606079102 18.9273509979248 19.52991485595703 19.35099220275879 19.01212882995605 19.35099220275879 L 3.384426832199097 19.35099220275879 C 2.866641521453857 19.35099220275879 2.442999124526978 18.9273509979248 2.442999124526978 18.40956497192383 L 2.442999124526978 12.38442611694336 C 2.442999124526978 11.8666410446167 2.866641521453857 11.4429988861084 3.384426832199097 11.4429988861084 L 19.01212882995605 11.4429988861084 C 19.52991485595703 11.4429988861084 19.95355606079102 11.8666410446167 19.95355606079102 12.38442611694336 L 19.95355606079102 18.40956497192383 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x9ig9m =
    '<svg viewBox="22.2 13.0 1.5 4.8" ><path transform="translate(-10.41, -1.41)" d="M 32.625 14.38593673706055 L 32.625 19.22487640380859 C 33.37814331054688 19.22487640380859 34.13128280639648 17.92099952697754 34.13128280639648 16.80540657043457 C 34.13128280639648 15.68981552124023 33.37814331054688 14.38593673706055 32.625 14.38593673706055 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gk6p09 =
    '<svg viewBox="3.4 12.4 15.6 6.0" ><path transform="translate(-1.12, -1.12)" d="M 19.56284332275391 13.5 L 5.06485652923584 13.5 C 4.754185676574707 13.5 4.5 13.75418472290039 4.5 14.06485748291016 L 4.5 18.96028137207031 C 4.5 19.27095222473145 4.754185676574707 19.52513694763184 5.06485652923584 19.52513694763184 L 19.56284332275391 19.52513694763184 C 19.87351417541504 19.52513694763184 20.12770080566406 19.27095222473145 20.12770080566406 18.96028137207031 L 20.12770080566406 14.06485748291016 C 20.12770080566406 13.75418472290039 19.87351417541504 13.5 19.56284332275391 13.5 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_utuf8x =
    '<svg viewBox="72.5 351.0 230.0 1.0" ><path transform="translate(72.5, 351.0)" d="M 0 0 L 28.75 0 L 230 0" fill="none" stroke="#b2b2b2" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezz0pd =
    '<svg viewBox="72.5 461.0 230.0 1.0" ><path transform="translate(72.5, 461.0)" d="M 0 0 L 230 0" fill="none" stroke="#b2b2b2" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kt315d =
    '<svg viewBox="72.5 406.0 230.0 1.0" ><path transform="translate(72.5, 406.0)" d="M 0 0 L 230 0" fill="none" stroke="#b2b2b2" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
