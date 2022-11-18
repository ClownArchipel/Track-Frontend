//import package
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_app/components/settings.dart';
import 'package:track_app/data/my_strings.dart';
import 'package:track_app/network/api.dart';
import 'package:track_app/pages/joinus/signinorregister.dart';
import '../background.dart';

class Profil extends StatefulWidget {
  Profil();

  @override
  ProfilState createState() => new ProfilState();
}

class ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    //deklarasi ukuran device
    Size size = MediaQuery.of(context).size;

    //nilai kembalian untuk profil
    return Background(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            //appbar pada profil
            SliverAppBar(
              backgroundColor: Colors.grey[300],
              expandedHeight: size.height / 3,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/bg_estetik.jpg',
                    fit: BoxFit.cover),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: (String value) {},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "Contact Us",
                      child: Text("Contact Us"),
                    ),
                  ],
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  transform: Matrix4.translationValues(0, 50, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          AssetImage("assets/images/photo_female_6.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        //body dari profil
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(height: 70),
                Text("Martha Harris", style: TextStyle(color: Colors.black)),
                Container(height: 15),
                Text(MyStrings.medium_lorem_ipsum,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black)),
                Container(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.amber,
                  ),
                  child: Text("LOGOUT", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    logout(context);
                  },
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  elevation: 2,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.person,
                                    size: 25.0, color: Colors.grey[500]),
                                Container(width: 10),
                                Text("Ubah Profil",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    )),
                                Spacer(),
                                Icon(Icons.chevron_right,
                                    size: 25.0, color: Colors.grey[500]),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.photo_camera,
                                    size: 25.0, color: Colors.red[400]),
                                Container(width: 10),
                                Text("Ubah Photo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                                Spacer(),
                                Icon(Icons.chevron_right,
                                    size: 25.0, color: Colors.grey[500]),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.password_outlined,
                                    size: 25.0, color: Colors.blue[300]),
                                Container(width: 10),
                                Text("Ubah Kata Sandi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                                Spacer(),
                                Icon(Icons.chevron_right,
                                    size: 25.0, color: Colors.grey[500]),
                              ],
                            ),
                          ),
                        ),
                        Container(height: 10),
                      ],
                    ),
                  ),
                ),
                Container(height: 30),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: 20,
                    child: Text('Track App',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[300],
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: 20,
                    child: Text('Version 0.0.1',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[300],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //fungsi untuk logout
  void logout(BuildContext context) async{
    var token;

    //set to logout
    var res = await Network().setLogout("/auth/logout");
    var body = json.decode(res.body);

    //get acces token from local storage
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!);

    //execute the logout function
    if(token!=null){
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>SignInOrRegister()));
      }
    }
}
