import 'dart:io';

import '../chickens/ChickenBase.dart';
import 'json_writer.dart';

class BuilderHelper{

  static preBuild(){
    var functions = Directory('./better_chicken/data/better_chicken/functions');
    if(functions.existsSync()){
      functions.deleteSync(recursive: true);
    }
  }
    static postBuild(){
      /*
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
      */
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

      ChickenBase.chickens.forEach((chicken) => {
        chicken.createModelJson()
      });
  }

}