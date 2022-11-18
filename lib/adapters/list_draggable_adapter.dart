import 'package:flutter/material.dart'; //import pakcage material
import 'package:track_app/models/document.dart';
import 'package:track_app/pages/scanqr.dart';//import pakcage scanqr

class ListBeranda {
  //deklarasi variabel global
  List items = <Document>[];
  Function onReorder;

  //deklarasi construct ListBeranda
  ListBeranda(this.items, this.onReorder);

  //widget fungsi untuk mengambil data
  Widget getView() {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      children: List.generate(
        this.items.length, (index) {
          return ItemTile(Key('$index'), index, this.items[index]);
        },
      ),
    );
  }

  //fungsi untuk bisa merubah urutan list
  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final Document item = this.items.removeAt(oldIndex);
    this.items.insert(newIndex, item);
    this.onReorder();
  }
}

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {
  final Document object;
  final int index;
  final Key key;

  const ItemTile(this.key, this.index, this.object);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: (){ 
             Navigator.push(context,MaterialPageRoute(builder: (context)=>ScanQr(object.name,object.nodoc)));
          },
          child: ListTile(
            key: PageStorageKey<int>(index),
            title: Text(object.name, style:TextStyle(color: Colors.black)),
            trailing: Icon(Icons.menu, color: Colors.grey[400]),
          ),
        ),
        Divider(height: 0)
      ],
    );
  }

}
