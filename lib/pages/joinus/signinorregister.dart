import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:track_app/pages/joinus/login.dart';
import 'package:track_app/pages/joinus/register.dart';

class SignInOrRegister extends StatefulWidget {
  @override
  _SignInOrRegisterState createState() => _SignInOrRegisterState();
}

class _SignInOrRegisterState extends State<SignInOrRegister> {
  @override
  Widget build(BuildContext context) {
    //deklarasi ukuran device
    Size size = MediaQuery.of(context).size;
    
    //dibawah ini syntax untuk membuat notifikasi transparan
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    //nilai widget kembalian dari class _SignInorRegisterState
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(            
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
          ),
          Builder(builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: size.width/5,
                      child: CircleAvatar(
                          backgroundColor: Colors.grey[50],
                          radius: size.width / 5.2,
                          child: Image.asset('assets/images/FL-1.jpg')),
                    ),
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    //TODO update this
                    'Track App',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () {
                      final snackbar = SnackBar(
                        content: Text('Please try email login'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      'assets/images/google_logo.png'),
                                ),
                              ],
                            )),
                        Container(
                          height: 50,
                          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Center(
                              child: Text(
                            'Google',
                            style: TextStyle(fontSize: 16),
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  InkWell(
                    onTap: () {
                      final snackbar = SnackBar(
                        content: Text('Please try email login'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff3B5998),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Image.asset(
                                      'assets/images/facebook_logo.png'),
                                ),
                              ],
                            )),
                        Container(
                          height: 50,
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                              child: Text(
                            'Facebook',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Center(
                        child: Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                          child: Text(
                        "Create account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
