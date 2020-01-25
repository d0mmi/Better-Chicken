import 'dart:convert';

import 'package:objd/basic/types/item.dart';

import 'custom_advancement.dart';

class RootAdvancement extends CustomAdvancement{
  String background;

  RootAdvancement(String name, String desc, dynamic icon, Map criteria,{Map icon_nbt = null, AdvancementFrame frame = AdvancementFrame.task, bool show_toast = true, bool announce_to_chat = true, bool hidden = false,this.background = "minecraft:textures/gui/advancements/backgrounds/stone.png"}) : super(name, desc, icon, criteria, icon_nbt: icon_nbt, frame: frame, show_toast: show_toast, announce_to_chat: announce_to_chat, hidden: hidden);

@override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json["display"]["background"] = background;
    return json;
  }
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}