//import package
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:track_app/pages/beranda.dart';
import 'package:track_app/pages/profil.dart';
import 'package:track_app/pages/tambah.dart';
import 'models/document.dart';
import 'models/pushNotif.dart';
import 'network/api.dart';
import 'pages/notifikasi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MyHomePage extends StatefulWidget {
  //mendeklarasikan parameter untuk class widget MyHomePage
  final int indexpage;
  final title;
  //deklarasi construct class MyHomePage
  MyHomePage({Key? key, required this.indexpage, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // deklarasi variabel class MyHomePage
  int _selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();
  String? input = '';
  String? output = '';
  //deklarasi halaman yang ditampilkan
  final _widgetOptions = [
    Beranda(),
    TambahForm(),
    Notifikasi(),
    Profil(),
  ];

  //dibawah ini deklarasi fungsi ketika halaman dimuat
  @override
  void initState() {
    super.initState();

    //dibawah ini fungsi untuk firebase
    //gettoken
    // messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   print("tokenfb: $value");
    // });

    //handling message in foreground
    // FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    //   print("message recieved");
    //   print(event.notification!.body);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   print('Message clicked!');
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   runApp(MyHomePage(indexpage: 0));
    // });

    //handling message in background
    // background();
  }

  // void background() {
  //   Future<void> _messageHandler(RemoteMessage message) async {
  //     print('background message ${message.notification!.body}');
  //   }

  //   void main() async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();
  //     FirebaseMessaging.onBackgroundMessage(_messageHandler);
  //     runApp(MyHomePage(indexpage: 0));
  //   }
  // }
  void dispose(){
    super.dispose();
  }

  //widget inti home main
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.all(1),
          child: FloatingActionButton(
              heroTag: "QrCode",
              backgroundColor: Colors.orange[600],
              elevation: 2,
              child: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              onPressed: () async {
                _scan();
              }),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),        
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_module),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              label: 'Tambah Doc',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          fixedColor: Colors.orange[600],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  //fungsi ketika bottom navigation di tekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //fungsi ketika tombol (floating button) scan ditekan
  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      output = barcode;
      Fluttertoast.showToast(msg: "Hasil scan : $output");
    }
  }
}
