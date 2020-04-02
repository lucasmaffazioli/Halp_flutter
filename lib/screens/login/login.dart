import 'package:halp/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:halp/components/big_button.dart';
import 'package:halp/misc/constants.dart';
import 'package:halp/screens/login/components/input_register.dart';
import 'package:halp/screens/login/components/waves_separator.dart';
import 'package:halp/screens/main_screen.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

enum ScreenStage { welcome, login, signUp }
final _validCharacters = RegExp(r"/^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789/i");
final _validCharactersEmail = RegExp(r"/^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789/i");

class _LoginState extends State<Login> {
  final loginController = TextEditingController();

  ScreenStage currentStage = ScreenStage.welcome;
  ScreenStage lastStage = ScreenStage.welcome;

  void setScreenStage(ScreenStage newStage) {
    print(newStage);
    setState(() {
      lastStage = currentStage;
      currentStage = newStage;
    });
  }

  Future<bool> _onBackPressed() async {
    if (currentStage == ScreenStage.welcome) {
      return true;
    } else {
      setState(() {
        currentStage = lastStage;
      });
      return false;
    }
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
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   // systemNavigationBarColor: Colors.blue,
    //   statusBarColor: secundaryPurple,
    // ));

    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
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
                      if (currentStage == ScreenStage.welcome)
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
            // Container(
            //   height: 50,
            //   color: Colors.amber[600],
            //   child: const Center(child: Text('Entry A')),
            // ),
            // Container(
            //   height: 50,
            //   color: Colors.amber[500],
            //   child: const Center(child: Text('Entry B')),
            // ),
            // Container(
            //   height: 50,
            //   color: Colors.amber[100],
            //   child: const Center(child: Text('Entry C')),
            // ),
            Center(
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.grey[500],
                size: 55,
              ),
            ),
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
              label: 'Age',
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
                  Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (r) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginComponent extends StatefulWidget {
  @override
  __LoginComponentState createState() => __LoginComponentState();
}

class __LoginComponentState extends State<_LoginComponent> {
  final _formKey = GlobalKey<FormState>();

  String _user;

  String _password;

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
              label: 'User',
              icon: Icon(Icons.mail),
              onSaved: (String newUser) {
                setState(() {
                  _user = newUser;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                // if (!_validCharacters.hasMatch(value)) {
                //   return 'Only alphanumeric characters are permited!';
                // }
                return null;
              },
            ),
            InputRegister(
              label: 'Password',
              icon: Icon(Icons.mail),
              onSaved: (String newPassword) {
                setState(() {
                  _password = newPassword;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                // if (!_validCharactersEmail.hasMatch(value)) {
                //   return 'Wrong format!';
                // }
                return null;
              },
            ),
            BigButton(
              'Login',
              filled: true,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save(); // Save our form now.
                  print('validated!');
                  print(_user);
                  print(_password);

                  Provider.of<LoginModel>(
                    context,
                    listen: false,
                  ).setLoggedUser(_user);

                  // LoginModel().setLoggedUser(_user);
                  // Navigator.pushNamed(context, FeedScreen.routeName);
                  Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (r) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
