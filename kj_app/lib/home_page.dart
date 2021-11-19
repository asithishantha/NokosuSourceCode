import 'package:flutter/material.dart';
import 'package:kjapp/gallery.dart';
import 'package:kjapp/login_page.dart';
import 'package:kjapp/upload_page.dart';
import 'package:provider/provider.dart';

import 'controllers/login_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_login_ui/pages/login_page.dart';
// import 'package:flutter_login_ui/pages/splash_screen.dart';
import 'header_widget.dart';

// import 'forgot_password_page.dart';
// import 'forgot_password_verification_page.dart';
// import 'registration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  // LoginPage log= new LoginPage();
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, model, child) {
      return Center(
          child: model.userDetails != null ? renderInfo(model) : Container());
    });
  }

  renderInfo(LoginController model) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green, Colors.blue])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.green, Colors.blue])
                    // color: Theme.of(context).primaryColor,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   stops: [0.0, 1.0],
                    //   colors: [
                    //     Theme.of(context).primaryColor,
                    //     Theme.of(context).accentColor,
                    //   ],
                    // ),
                    ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    " NOKOSU ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.screen_lock_landscape_rounded,
              //     size: _drawerIconSize,
              //     color: Theme.of(context).accentColor,
              //   ),
              //   title: Text(
              //     'Splash Screen',
              //     style: TextStyle(
              //         fontSize: 17, color: Theme.of(context).accentColor),
              //   ),
              //   // onTap: () {
              //   //   Navigator.push(
              //   //       context,
              //   //       MaterialPageRoute(
              //   //           builder: (context) =>
              //   //               SplashScreen(title: "Splash Screen")));
              //   // },
              // ),
              // ListTile(
              //   leading: Icon(Icons.login_rounded,
              //       size: _drawerIconSize,
              //       color: Theme.of(context).accentColor),
              //   title: Text(
              //     'Login Page',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginPage()),
              //     );
              //   },
              // ),
              // Divider(
              //   color: Theme.of(context).primaryColor,
              //   height: 1,
              // ),
              // ListTile(
              //   leading: Icon(Icons.person_add_alt_1,
              //       size: _drawerIconSize,
              //       color: Theme.of(context).accentColor),
              //   title: Text(
              //     'Gallery View',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MediaGrid()),
              //     );
              //   },
              // ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Create KJ法/Nokosu card',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uploader()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.verified_user_sharp,
              //     size: _drawerIconSize,
              //     color: Theme.of(context).accentColor,
              //   ),
              //   title: Text(
              //     'Verification Page',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   // onTap: () {
              //   //   Navigator.push(
              //   //     context,
              //   //     MaterialPageRoute(
              //   //         builder: (context) => ForgotPasswordVerificationPage()),
              //   //   );
              //   // },
              // ),      ListTile(
              //   leading: Icon(
              //     Icons.verified_user_sharp,
              //     size: _drawerIconSize,
              //     color: Theme.of(context).accentColor,
              //   ),
              //   title: Text(
              //     'Verification Page',
              //     style: TextStyle(
              //         fontSize: _drawerFontSize,
              //         color: Theme.of(context).accentColor),
              //   ),
              //   // onTap: () {
              //   //   Navigator.push(
              //   //     context,
              //   //     MaterialPageRoute(
              //   //         builder: (context) => ForgotPasswordVerificationPage()),
              //   //   );
              //   // },
              // ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Close Application',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          Image.network(model.userDetails!.photoURL ?? "")
                              .image,
                      radius: 80,
                    ),
                    // child: Icon(
                    //   Icons.person,
                    //   size: 80,
                    //   color: Colors.grey.shade300,
                    // ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Text(model.userDetails!.displayName ?? ""),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(model.userDetails!.email ?? ""),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   padding:
                        //       const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "User Information",
                        //     style: TextStyle(
                        //       color: Colors.black87,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 16,
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.person),
                                          title: Text("Name"),
                                          subtitle: Text(
                                              model.userDetails!.displayName ??
                                                  ""),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(
                                              model.userDetails!.email ?? ""),
                                        ),
                                        ListTile(
                                            title: ActionChip(
                                                avatar: Icon(Icons.logout),
                                                label: Text("Logout"),
                                                onPressed: () {
                                                  Provider.of<LoginController>(
                                                          context,
                                                          listen: false)
                                                      .logout(context);
                                                })),
                                        // ListTile(
                                        //   leading: Icon(Icons.prof),
                                        //   title: Text("About Me"),
                                        //   subtitle: Text(
                                        //       "This is a about me link and you can khow about me in this section."),
                                        // ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,

//       // our ui will have 3 children, name, email, photo , logout button

//       children: [
//         CircleAvatar(
//           backgroundImage:
//               Image.network(model.userDetails!.photoURL ?? "").image,
//           radius: 50,
//         ),

//         Text(model.userDetails!.displayName ?? ""),
//         Text(model.userDetails!.email ?? ""),

//         // logout
    // ActionChip(
    //     avatar: Icon(Icons.logout),
    //     label: Text("Logout"),
    //     onPressed: () {
    //       Provider.of<LoginController>(context, listen: false)
    //           .logout(context);
    //     })
//       ],
//     );
//   }
  }

// class ProfilePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ProfilePageState();
//   }
// }

// class _ProfilePageState extends State<ProfilePage> {
//   double _drawerIconSize = 24;
//   double _drawerFontSize = 17;

  // @override
  // Widget build(BuildContext context) {

  // return Scaffold(
  //   appBar: AppBar(
  //     title: Text(
  //       "Profile Page",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //     ),
  //     elevation: 0.5,
  //     iconTheme: IconThemeData(color: Colors.white),
  //     flexibleSpace: Container(
  //       decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               colors: <Color>[
  //             Theme.of(context).primaryColor,
  //             Theme.of(context).accentColor,
  //           ])),
  //     ),
  //     actions: [
  //       Container(
  //         margin: EdgeInsets.only(
  //           top: 16,
  //           right: 16,
  //         ),
  //         child: Stack(
  //           children: <Widget>[
  //             Icon(Icons.notifications),
  //             Positioned(
  //               right: 0,
  //               child: Container(
  //                 padding: EdgeInsets.all(1),
  //                 decoration: BoxDecoration(
  //                   color: Colors.red,
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //                 constraints: BoxConstraints(
  //                   minWidth: 12,
  //                   minHeight: 12,
  //                 ),
  //                 child: Text(
  //                   '5',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       )
  //     ],
  //   ),
  //   drawer: Drawer(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               stops: [
  //             0.0,
  //             1.0
  //           ],
  //               colors: [
  //             Theme.of(context).primaryColor.withOpacity(0.2),
  //             Theme.of(context).accentColor.withOpacity(0.5),
  //           ])),
  //       child: ListView(
  //         children: [
  //           DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: Theme.of(context).primaryColor,
  //               gradient: LinearGradient(
  //                 begin: Alignment.topLeft,
  //                 end: Alignment.bottomRight,
  //                 stops: [0.0, 1.0],
  //                 colors: [
  //                   Theme.of(context).primaryColor,
  //                   Theme.of(context).accentColor,
  //                 ],
  //               ),
  //             ),
  //             child: Container(
  //               alignment: Alignment.bottomLeft,
  //               child: Text(
  //                 "FlutterTutorial.Net",
  //                 style: TextStyle(
  //                     fontSize: 25,
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.screen_lock_landscape_rounded,
  //               size: _drawerIconSize,
  //               color: Theme.of(context).accentColor,
  //             ),
  //             title: Text(
  //               'Splash Screen',
  //               style: TextStyle(
  //                   fontSize: 17, color: Theme.of(context).accentColor),
  //             ),
  //             // onTap: () {
  //             //   Navigator.push(
  //             //       context,
  //             //       MaterialPageRoute(
  //             //           builder: (context) =>
  //             //               SplashScreen(title: "Splash Screen")));
  //             // },
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.login_rounded,
  //                 size: _drawerIconSize,
  //                 color: Theme.of(context).accentColor),
  //             title: Text(
  //               'Login Page',
  //               style: TextStyle(
  //                   fontSize: _drawerFontSize,
  //                   color: Theme.of(context).accentColor),
  //             ),
  //             // onTap: () {
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(builder: (context) => LoginPage()),
  //             //   );
  //             // },
  //           ),
  //           Divider(
  //             color: Theme.of(context).primaryColor,
  //             height: 1,
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.person_add_alt_1,
  //                 size: _drawerIconSize,
  //                 color: Theme.of(context).accentColor),
  //             title: Text(
  //               'Registration Page',
  //               style: TextStyle(
  //                   fontSize: _drawerFontSize,
  //                   color: Theme.of(context).accentColor),
  //             ),
  //             // onTap: () {
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(builder: (context) => RegistrationPage()),
  //             //   );
  //             // },
  //           ),
  //           Divider(
  //             color: Theme.of(context).primaryColor,
  //             height: 1,
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.password_rounded,
  //               size: _drawerIconSize,
  //               color: Theme.of(context).accentColor,
  //             ),
  //             title: Text(
  //               'Forgot Password Page',
  //               style: TextStyle(
  //                   fontSize: _drawerFontSize,
  //                   color: Theme.of(context).accentColor),
  //             ),
  //             // onTap: () {
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(
  //             //         builder: (context) => ForgotPasswordPage()),
  //             //   );
  //             // },
  //           ),
  //           Divider(
  //             color: Theme.of(context).primaryColor,
  //             height: 1,
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.verified_user_sharp,
  //               size: _drawerIconSize,
  //               color: Theme.of(context).accentColor,
  //             ),
  //             title: Text(
  //               'Verification Page',
  //               style: TextStyle(
  //                   fontSize: _drawerFontSize,
  //                   color: Theme.of(context).accentColor),
  //             ),
  //             // onTap: () {
  //             //   Navigator.push(
  //             //     context,
  //             //     MaterialPageRoute(
  //             //         builder: (context) => ForgotPasswordVerificationPage()),
  //             //   );
  //             // },
  //           ),
  //           Divider(
  //             color: Theme.of(context).primaryColor,
  //             height: 1,
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.logout_rounded,
  //               size: _drawerIconSize,
  //               color: Theme.of(context).accentColor,
  //             ),
  //             title: Text(
  //               'Logout',
  //               style: TextStyle(
  //                   fontSize: _drawerFontSize,
  //                   color: Theme.of(context).accentColor),
  //             ),
  //             onTap: () {
  //               SystemNavigator.pop();
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  //   body: SingleChildScrollView(
  //     child: Stack(
  //       children: [
  //         Container(
  //           height: 100,
  //           child: HeaderWidget(100, false, Icons.house_rounded),
  //         ),
  //         Container(
  //           alignment: Alignment.center,
  //           margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
  //           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //           child: Column(
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(100),
  //                   border: Border.all(width: 5, color: Colors.white),
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black12,
  //                       blurRadius: 20,
  //                       offset: const Offset(5, 5),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Icon(
  //                   Icons.person,
  //                   size: 80,
  //                   color: Colors.grey.shade300,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Text(
  //                 'Mr. Donald Trump',
  //                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Text(
  //                 'Former President',
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Container(
  //                 padding: EdgeInsets.all(10),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Container(
  //                       padding:
  //                           const EdgeInsets.only(left: 8.0, bottom: 4.0),
  //                       alignment: Alignment.topLeft,
  //                       child: Text(
  //                         "User Information",
  //                         style: TextStyle(
  //                           color: Colors.black87,
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                         ),
  //                         textAlign: TextAlign.left,
  //                       ),
  //                     ),
  //                     Card(
  //                       child: Container(
  //                         alignment: Alignment.topLeft,
  //                         padding: EdgeInsets.all(15),
  //                         child: Column(
  //                           children: <Widget>[
  //                             Column(
  //                               children: <Widget>[
  //                                 ...ListTile.divideTiles(
  //                                   color: Colors.grey,
  //                                   tiles: [
  //                                     ListTile(
  //                                       contentPadding: EdgeInsets.symmetric(
  //                                           horizontal: 12, vertical: 4),
  //                                       leading: Icon(Icons.my_location),
  //                                       title: Text("Location"),
  //                                       subtitle: Text("USA"),
  //                                     ),
  //                                     ListTile(
  //                                       leading: Icon(Icons.email),
  //                                       title: Text("Email"),
  //                                       subtitle:
  //                                           Text("donaldtrump@gmail.com"),
  //                                     ),
  //                                     ListTile(
  //                                       leading: Icon(Icons.phone),
  //                                       title: Text("Phone"),
  //                                       subtitle: Text("99--99876-56"),
  //                                     ),
  //                                     ListTile(
  //                                       leading: Icon(Icons.person),
  //                                       title: Text("About Me"),
  //                                       subtitle: Text(
  //                                           "This is a about me link and you can khow about me in this section."),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  //   // );
  // }
}
