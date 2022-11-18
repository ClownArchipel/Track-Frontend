//componen setting yang dipisahkan untuk membuat halaman lebih ringkas dan mudah dibaca serta penggunaan yang efisien
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Card(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0)),
              elevation: 2,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.person, size: 25.0, color: Colors.grey[500]),
                            Container(width: 10),
                            Text("Account", style: TextStyle(
                              fontSize: 200,
                              fontWeight: FontWeight.w400,
                            )),
                            Spacer(),
                            Icon(Icons.chevron_right, size: 25.0, color: Colors.grey[500]),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.email, size: 25.0, color: Colors.red[400]),
                            Container(width: 10),
                            Text("Gmail", style: TextStyle(
                              fontWeight: FontWeight.w300
                            )),
                            Spacer(),
                            Icon(Icons.chevron_right, size: 25.0, color: Colors.grey[500]),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.sync, size: 25.0, color: Colors.blue[300]),
                            Container(width: 10),
                            Text("Sync Data", style: TextStyle(
                              fontWeight: FontWeight.w300
                            )),
                            Spacer(),
                            Icon(Icons.chevron_right, size: 25.0, color: Colors.grey[500]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                  ],
                ),
              ),
            );
  }
}