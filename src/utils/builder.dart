import 'dart:io';


import 'package:objd/basic/types/item.dart';

import '../chickens/ChickenBase.dart';
import '../chickens/breeding/BreedingRecipe.dart';
import '../tools/tool.dart';
import 'advancement/advancement_builder.dart';
import 'advancement/custom_advancement.dart';
import 'advancement/root_advancement.dart';
import 'copy_dir.dart';
import 'json_writer.dart';

class BuilderHelper{

  static preBuild(){
    var functions = Directory('./better_chicken/data/better_chicken/functions');
    if(functions.existsSync()){
      functions.deleteSync(recursive: true);
    }
  }
    static postBuild({bool copy = false}){
      
      var models  = Directory("resources/assets/minecraft/models/item/cookie/");
      if(models.existsSync()){
        models.deleteSync(recursive: true);
      }
      models.createSync(recursive: true);
      var cookie  = File("resources/assets/minecraft/models/item/cookie.json");
      if(cookie.existsSync()){
        cookie.deleteSync(recursive: true);
      }
      cookie.createSync(recursive: true);
      JsonWriter.writeJson(cookie.path, JsonWriter.readJson("src/chickens/cookie.json"));
      List<CustomAdvancement> advancements = [];
      for(var chicken in ChickenBase.chickens){
        var criteria = {
          "bc_" + chicken.name.toLowerCase().replaceAll(" ", "_") : {
            "trigger": "minecraft:impossible"
          }
        };
        chicken.createModelJson();
        var recipe = BreedingRecipe.getParent(chicken);
        if(recipe == null){
          advancements.add(CustomAdvancement(chicken.name,"Find a " + chicken.name,chicken.drops[0].type,criteria));
        }else{
          advancements.add(CustomAdvancement(chicken.name,"Breed " + recipe.chicken1.name + " with " + recipe.chicken2.name,chicken.drops[0].type,criteria,parent: recipe.chicken1.name));
        }
      }

      for (var tool in Tool.tools) {
        var criteria = {
          "bc_" + tool.name.toLowerCase().replaceAll(" ", "_") : {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "item": tool.tool.type.toString(),
                        "nbt": tool.tool.tag.toString()
                    }
                ]
            }
          }
        };
        var description = "Throw at Chicken:";

        for (var item in tool.crafting) {
          description += " " + item.count.toString() + "x " + item.type.toString().replaceAll("minecraft:", "").replaceAll("_", " ");
        }

        advancements.add(CustomAdvancement(tool.name, description, tool.tool.type, criteria,icon_nbt: tool.tool.tag));
      }

      var root = RootAdvancement("Better Chicken","Install the Better Chicken Datapack",Items.feather,{
          "bc_install": {
            "trigger": "minecraft:tick"
          }
        });
      AdvancementBuilder(root, advancements).build(namespace: "better_chicken");
      if(copy){
        var datapack = Directory("C:/Users/DommiHD/AppData/Roaming/.minecraft/saves/SpacePack/datapacks/better_chicken");
        if(datapack.existsSync()){
          datapack.deleteSync(recursive: true);
        }
        copyDirectory(Directory("./better_chicken"), datapack);

        var resource_pack  = Directory("C:/Users/DommiHD/AppData/Roaming/.minecraft/resourcepacks/resources");
        if(resource_pack.existsSync()){
          resource_pack.deleteSync(recursive: true);
        }
        copyDirectory(Directory("./resources"), resource_pack);
      }
  }

}