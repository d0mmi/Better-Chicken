import 'dart:convert';

import 'package:objd/basic/item.dart';

class AdvancementFrame{
  final String name;
  const AdvancementFrame(this.name);

  static const AdvancementFrame task = AdvancementFrame("task");
  static const AdvancementFrame challenge = AdvancementFrame("challenge");
  static const AdvancementFrame goal = AdvancementFrame("goal");

  @override
  String toString() {
    return name;
  }
}

class CustomAdvancement{
  static List<CustomAdvancement> advancements = [];
  String namespace = "default";
  String name;
  String desc;
  ItemType icon;
  Map<String,dynamic> icon_nbt;
  AdvancementFrame frame;
  bool show_toast;
  bool announce_to_chat;
  bool hidden;
  Map<String,dynamic> criteria;
  CustomAdvancement parent;

  CustomAdvancement(this.name, this.desc,this.icon,this.criteria,{this.icon_nbt = null, this.frame = AdvancementFrame.task, this.show_toast = true, this.announce_to_chat = true, this.hidden = false, this.parent = null}){
    advancements.add(this);
  }

  Map<String,dynamic> toMap() {
    Map<String,dynamic> json = {
      "display": {
        "title": {
            "text": name
        },
        "description": {
            "text": desc
        },
        "icon": {
            "item": icon.toString(),
        },
        "frame": frame.toString(),
        "show_toast": show_toast,
        "announce_to_chat": announce_to_chat,
        "hidden": hidden
    },
    "criteria": criteria
    };
    if(icon_nbt != null){
      json["icon"]["nbt"] = icon_nbt;
    }
    if(parent != null){
      json["parent"] = namespace + ":"+parent.name;
    }
    return json;
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }

}