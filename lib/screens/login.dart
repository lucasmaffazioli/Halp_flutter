import 'package:flutter/material.dart';
import 'package:halp/components/big_button.dart';
import 'package:halp/components/waves_separator.dart';
// import 'package:halp/screens/feed_screen.dart';
import 'package:halp/misc/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum ScreenStage { welcome, login, signUp }
ScreenStage currentStage = ScreenStage.welcome;
ScreenStage lastStage;

class _LoginState extends State<Login> {
  final loginController = TextEditingController();

  void setScreenStage(ScreenStage newStage) {
    setState(() {
      lastStage = currentStage;
      currentStage = newStage;
    });
  }

  // Widget getInput() {
  //   if (currentStage == ScreenStage.welcome) {
  //     return Container(
  //       child: CustomPaint(
  //         painter: WavesSeparator(),
  //         child: Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 60, 0, 25),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               BigButton(
  //                 'Login',
  //                 onPressed: () {
  //                   setScreenStage(ScreenStage.login);
  //                 },
  //               ),
  //               BigButton(
  //                 'Sign up',
  //                 filled: true,
  //                 onPressed: () {
  //                   setScreenStage(ScreenStage.signUp);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (currentStage == ScreenStage.login) {
  //     return Container(
  //       child: CustomPaint(
  //         painter: WavesSeparator(),
  //         child: Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 60, 0, 25),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               BigButton(
  //                 'Login',
  //                 onPressed: () {
  //                   setScreenStage(ScreenStage.login);
  //                   // Navigator.push(
  //                   //   context,
  //                   //   MaterialPageRoute(
  //                   //     builder: (context) => FeedScreen(),
  //                   //   ),
  //                   // );
  //                 },
  //               ),
  //               BigButton(
  //                 'Sign up',
  //                 filled: true,
  //                 onPressed: () {
  //                   setScreenStage(ScreenStage.signUp);
  //                   // Navigator.push(
  //                   //   context,
  //                   //   MaterialPageRoute(
  //                   //     builder: (context) => FeedScreen(),
  //                   //   ),
  //                   // );
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (currentStage == ScreenStage.signUp) {}
  //   return Container(
  //     child: CustomPaint(
  //       painter: WavesSeparator(),
  //       child: Padding(
  //         padding: const EdgeInsets.fromLTRB(0, 60, 0, 25),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             // BigButton(
  //             //   'Login',
  //             //   onPressed: () {
  //             //     setScreenStage(ScreenStage.login);
  //             //     // Navigator.push(
  //             //     //   context,
  //             //     //   MaterialPageRoute(
  //             //     //     builder: (context) => FeedScreen(),
  //             //     //   ),
  //             //     // );
  //             //   },
  //             // ),
  //             BigButton(
  //               'Sign up',
  //               filled: true,
  //               onPressed: () {
  //                 setScreenStage(ScreenStage.signUp);
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => FeedScreen(),
  //                 //   ),
  //                 // );
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<bool> _onBackPressed() {
    print('backPressed');
    setState(() {
      currentStage = lastStage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: mainFont,
        // fontWeight: FontWeight.normal,q
      ),
      home: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [mainPurple, secundaryPurple])),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'HALP.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 46,
                            fontFamily: mainFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36),
                          child: Text(
                            '''HALP existe para você 
encontrar todas as 
respostas para sua vida''',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontFamily: mainFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: CustomPaint(
                      painter: WavesSeparator(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60, 0, 25),
                        child: _Action(
                          setScreen: setScreenStage,
                        ),
                      ),
                    ),
                  ),
                  // getInput(),
                  // getInput(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final Function setScreen;
  _Action({this.setScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BigButton(
          'Login',
          onPressed: () {
            setScreen(ScreenStage.login);
          },
        ),
        BigButton(
          'Sign up',
          filled: true,
          onPressed: () {
            setScreen(ScreenStage.signUp);
          },
        ),
      ],
    );
  }
}
