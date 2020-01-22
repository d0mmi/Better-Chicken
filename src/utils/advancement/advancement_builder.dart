import 'dart:io';

import 'custom_advancement.dart';
import 'root_advancement.dart';

class AdvancementBuilder{
  RootAdvancement root;
  List<CustomAdvancement> advancements;

  AdvancementBuilder(this.root,this.advancements){
    advancements.forEach((advancement) => {
      if(advancement.parent == null){
        advancement.parent = "root"
      }
    });
  }

  build({String namespace = "default"}){
    String path = namespace+"/data/"+namespace+"/advancements";
    Directory dir = Directory(path);
    if(dir.existsSync()){
      dir.deleteSync(recursive: true);
    }
    dir.createSync(recursive: true);
    File rootFile = File(path+"/root.json");
    root.namespace = namespace;
    rootFile.writeAsStringSync(root.toString());
    advancements.forEach((advancement) => {
      advancement.namespace = namespace,
      File(path+"/"+advancement.name.toLowerCase().replaceAll(" ", "_")+".json").writeAsStringSync(advancement.toString())
    });
  }

}