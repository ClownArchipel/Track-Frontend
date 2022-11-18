//import package
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:track_app/network/api.dart';

class TambahForm extends StatefulWidget {

  TambahForm();

  @override
  TambahFormState createState() => new TambahFormState();
}


class TambahFormState extends State<TambahForm> {
  //deklarasi variabel class TambahFromState
  TextStyle textStyle = TextStyle(color: Colors.black, height: 1.4, fontSize: 16);
  TextStyle labelStyle = TextStyle(color: Colors.black);
  UnderlineInputBorder lineStyle1 = UnderlineInputBorder(borderSide: BorderSide( width: 1));
  UnderlineInputBorder lineStyle2 = UnderlineInputBorder(borderSide: BorderSide( width: 2));

  String? name;
    final TextEditingController _name = new TextEditingController();
  String? nodoc;
    final TextEditingController _nodoc = new TextEditingController();
  String? sender;
    final TextEditingController _sender = new TextEditingController();
  String? receiver;
    final TextEditingController _receiver = new TextEditingController();
  String? kategori;
    final TextEditingController _kategori = new TextEditingController();
  String? prioritas;
    final TextEditingController _prioritas = new TextEditingController();
  String? file;
    final TextEditingController _file = new TextEditingController();
  String? deskripsi;
    final TextEditingController _deskripsi = new TextEditingController();
  String? uuid = '1101';


  @override
  Widget build(BuildContext context) {
    //deklarasi ukuran device
    Size size = MediaQuery.of(context).size;

    //nilai return widget Tambah
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tambah Document'),
          brightness: Brightness.dark,
          backgroundColor: Colors.orange[600],
          automaticallyImplyLeading: false,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (context)=>[
                PopupMenuItem(
                  value: 'Help',
                  child: TextButton(
                    onPressed: (){},
                    child: Text('Help',
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 18,
                      ),),),
                )
              ])
          ]
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: 230, width: double.infinity,
              color: Colors.grey,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: size.width,
                      child: Image.asset('assets/images/bg_add.jpg',
                        fit: BoxFit.fitWidth,),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 40.0, 0.0),
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(heroTag: "fab3",
                      backgroundColor: Colors.blueGrey[800], elevation: 3,
                      child: Icon(Icons.add, color: Colors.white),
                      onPressed: () { 
                        add(); 
                        _name.clear();
                        _nodoc.clear();
                        _sender.clear();
                        _receiver.clear();
                        _kategori.clear();
                        _prioritas.clear();
                        _file.clear();
                        _deskripsi.clear();},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    onChanged: (value)=>name = value,
                    controller: _name,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.create_new_folder, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Nama Document", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>nodoc = value,
                    controller: _nodoc,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.pin, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Nomor Document", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ), 
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>sender= value,
                    controller: _sender,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.person, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Pengirim", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>receiver= value,
                    controller: _receiver,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.person_add, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Penerima", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  TextField(
                    onChanged: (value)=>kategori = value,
                    controller: _kategori,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.category, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Kategori Dokumen", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>prioritas = value,
                    controller: _prioritas,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.low_priority, color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Prioritas", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>file = value,
                    controller: _file,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.upload_file,color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "File", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    onChanged: (value)=>deskripsi = value,
                    controller: _deskripsi,
                    style: textStyle, keyboardType: TextInputType.text, cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(child: Icon(Icons.text_fields,color: Colors.grey), margin: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      labelText: "Description", labelStyle: labelStyle,
                      enabledBorder: lineStyle1, focusedBorder: lineStyle2,
                    ),
                  ),
                  Container(height: 10),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  void add() async {
    Map data = {
      'name':name,
      'no_document':nodoc,
      'sender': sender,
      'receiver': receiver,
      'category_id': kategori,
      'priority_id': prioritas,
      'file': file,
      'description': deskripsi,
      'uuid':uuid,
    };
    var res = await Network().postData(data, "/documents");
    var body = json.decode(res.body);
    if (body!=null) {
      //menampilkan toaster
      Fluttertoast.showToast(
          msg: 'Success ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    } else {
      //menampilkan toaster
      Fluttertoast.showToast(
          msg: 'Please check your input',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }
}

