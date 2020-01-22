import 'dart:convert';

import 'package:objd/basic/item.dart';

import 'custom_advancement.dart';

class RootAdvancement extends CustomAdvancement{
  String background;

  RootAdvancement(String desc, ItemType icon, Map criteria,{this.background = "minecraft:textures/gui/advancements/backgrounds/stone.png"}) : super("root", desc, icon, criteria);

@override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json["background"] = background;
    return json;
  }
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}