import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:track_app/adapters/list_draggable_adapter.dart';
import 'package:track_app/background.dart';
import 'package:track_app/models/document.dart';
import 'package:track_app/network/api.dart';

class Beranda extends StatefulWidget {

  Beranda();

  @override
  BerandaState createState() => new BerandaState();
}

class BerandaState extends State<Beranda> {
  //deklarasi variabel
  late BuildContext context;
  List<Document>? doc= [];

  _getDoc(){
    Network().getDocuments("/documents").then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        doc = list.map((e) => Document.fromJson(e)).toList();
      });
    });  
  }

  void onReorder() {
    setState(() {});
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
    //deklarasi device
      Size size =  MediaQuery.of(context).size;
      
      return new Background(
        child:NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.orange[600],
                expandedHeight: size.height/2,
                floating: false,
                automaticallyImplyLeading: false,
                flexibleSpace: Center(
                  child: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: Container(
                        transform: Matrix4.translationValues(0, 50, 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: size.width/5,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[50],
                            radius: size.width/5.2,
                            child: Image.asset('assets/images/FL-1.jpg')),
                        ),
                      ),
                    ),
                ),
                title: TextButton(
                  onPressed: (){
                  },
                  style: ButtonStyle(

                  ),
                  child: Text('TrackApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width/20,
                      fontWeight: FontWeight.bold
                    ),)),
                actions: [
                  PopupMenuButton<String>(
                    onSelected: (String value){},
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "About Us",
                        child: Text("About Us"),
                      ),
                    ],
                  )
                ],
              )
            ];
          },
          body: ListBeranda(doc!, onReorder).getView()),
      );
    }
}

