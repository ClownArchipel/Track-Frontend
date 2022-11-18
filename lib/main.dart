import 'package:flutter/material.dart';//import material 
import 'package:track_app/home-main.dart';
import 'package:track_app/pages/beranda.dart';
import 'package:track_app/pages/joinus/signinorregister.dart'; // import file untuk dapat memanggil widget / halaman sign in or register

void main() {
  runApp(MyApp());//fungsi main untuk running progam awal
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp( //widget base (root) sebagai awalan project
    debugShowCheckedModeBanner: false, // syntax dengan parameter untuk menghilangkan banner debug
      title: 'Track App', // syntax untuk judul project
      theme: ThemeData( // widget untuk memberi tema project
        primarySwatch: Colors.blue, //syntax warna inti project
      ),
      // home: SignInOrRegister(),//syntax untuk mengarahkan home project , disini diarahkan ke halaman Sign in atau Register pada file (signinorregister.dart)
      home: MyHomePage(indexpage: 0,),
    );
  }
}


