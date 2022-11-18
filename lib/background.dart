//import package
import 'package:flutter/material.dart';

//class main background dengan extends statelees widget
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //mendaklarasikan ukuran device
    Size size = MediaQuery.of(context).size;

    //return dari class background
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              child,
            ],
          ),
        ),
      ),
    );
  }
}
