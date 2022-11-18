//import package
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../background.dart';

class ScanQr extends StatelessWidget {
  //deklarasi parameter ScanQr
  final String? name;
  final String? nodoc;
  //deklarasi construct ScanQr
  ScanQr(this.name,this.nodoc);

  //Widget inti untuk ScanQr
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Qr Track',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Background(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                Text(name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                SizedBox(
                  height: 15,
                ),
                QrImage(
                  data: nodoc.toString(),
                  version: QrVersions.auto,
                  size: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("No Document : ${nodoc.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
              ],
            ),
          ),
        ));
  }
}
