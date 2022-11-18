import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:track_app/adapters/list_notifikasi.dart';
import 'package:track_app/models/document.dart';
import 'package:track_app/network/api.dart';

class Notifikasi extends StatefulWidget {

  Notifikasi();

  @override
  NotifikasiState createState() => new NotifikasiState();
}

class NotifikasiState extends State<Notifikasi> {
  //deklarasi variabel
  late BuildContext context;
  List<Document>? doc = [];

  void onReorder() {
    setState(() {});
  }
   _getDoc(){
    Network().getDocuments("/documents").then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        doc = list.map((e) => Document.fromJson(e)).toList();
      });
    });  
  }

  @override
  void initState() {
    super.initState();
    _getDoc();
  }
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      //appbar untuk halaman notifikasi
      appBar: AppBar(
        title: Text('Pemberitahuan'),
        centerTitle: true,
        backgroundColor: Colors.orange[600],
        automaticallyImplyLeading: false,
      ),

      //body untuk halaman notifikasi
      body: Stack(
        children:[
          //content notifikasi
          Card(
            child: ListNotifikasi(doc!, onReorder).getView()),
        ] ),
    );
  }
}

