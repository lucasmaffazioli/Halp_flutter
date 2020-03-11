import 'package:flutter/material.dart';
import 'package:halp/components/big_button.dart';
import 'package:halp/components/input_register.dart';
import 'package:halp/components/waves_separator.dart';
// import 'package:halp/screens/feed_screen.dart';
import 'package:halp/misc/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum ScreenStage { welcome, login, signUp }
final _validCharacters = RegExp(r"/^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789/i");
final _validCharactersEmail = RegExp(r"/^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789/i");

class _LoginState extends State<Login> {
  final loginController = TextEditingController();

  ScreenStage currentStage = ScreenStage.welcome;
  ScreenStage lastStage;

  void setScreenStage(ScreenStage newStage) {
    print(newStage);
    setState(() {
      lastStage = currentStage;
      currentStage = newStage;
    });
  }

  Future<bool> _onBackPressed() {
    setState(() {
      currentStage = lastStage;
    });
  }

  getInput() {
    switch (currentStage) {
      case ScreenStage.welcome:
        {
          return _WelcomeComponent(
            setScreen: setScreenStage,
          );
        }
        break;

      case ScreenStage.login:
        {
          return _LoginComponent();
        }
        break;

      case ScreenStage.signUp:
        {
          return _SignUpComponent();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainPurple,
        accentColor: secundaryPurple,
        cursorColor: secundaryPurple,
        fontFamily: mainFont,
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
                        if (currentStage != ScreenStage.signUp)
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
                        child: getInput(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeComponent extends StatelessWidget {
  final Function setScreen;
  _WelcomeComponent({this.setScreen});

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

class _SignUpComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputRegister(
              label: 'Name',
              icon: Icon(Icons.mail),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!_validCharacters.hasMatch(value)) {
                  return 'Only alphanumeric characters are permited!';
                }
                return null;
              },
            ),
            InputRegister(
              label: 'E-mail',
              icon: Icon(Icons.mail),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!_validCharactersEmail.hasMatch(value)) {
                  return 'Wrong format!';
                }
                return null;
              },
            ),
            InputRegister(
              label: 'Password',
              icon: Icon(Icons.mail),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!_validCharactersEmail.hasMatch(value)) {
                  return 'Wrong format!';
                }
                return null;
              },
            ),
            InputRegister(
              label: 'Birthday',
              icon: Icon(Icons.mail),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!_validCharactersEmail.hasMatch(value)) {
                  return 'Wrong format!';
                }
                return null;
              },
            ),
            BigButton(
              'Register',
              filled: true,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('validated!');
                }
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16.0),
            //   child: RaisedButton(
            //     onPressed: () {
            //       // Validate will return true if the form is valid, or false if
            //       // the form is invalid.
            //       if (_formKey.currentState.validate()) {
            //         // Process data.
            //       }
            //     },
            //     child: Text('Submit'),
            //   ),
            // ),
          ],
        ),
      ),
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: <Widget>[
    //     BigButton(
    //       'Sign up',
    //       filled: true,
    //       onPressed: () {},
    //     ),
    //   ],
    // );
  }
}

class _LoginComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BigButton(
          'Login',
          filled: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
