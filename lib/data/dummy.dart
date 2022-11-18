import 'dart:math';
import 'package:track_app/models/people.dart';

class Dummy {
  static Random random = new Random();

  static const List<String> peopleNames = [
    "Anderson Thomas", "Adams Green", "Laura Michelle", "Betty L", "Miller Wilson",
    "Roberts Turner", "Garcia Lewis", "Mary Jackson", "Kevin John", "Evans Collins",
    "Sarah Scott", "Elizabeth", "Roberts", "Anthony C", "Susan Lee"
  ];

  static List<People> getPeopleData() {
    List<People> items = [];

    for (int i = 0; i < peopleNames.length; i++) {
      People obj = new People();
      obj.name = peopleNames[i];
      obj.email = getEmailFromName(obj.name);
      items.add(obj);
    }
    items.shuffle();
    return items;
  }

  static String getEmailFromName(String name) {
    if (name.isNotEmpty) {
      String email = name.replaceAll(" ", ".").toLowerCase() + "@mail.com";
      return email;
    }
    return name;
  }

}