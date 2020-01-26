import 'package:objd/basic/types/items.dart';
import 'package:objd/core.dart';

import '../manager/DropManager.dart';
import '../utils/json_writer.dart';
import 'breeding/BreedingRecipe.dart';

class ChickenSpawning{
  final String name;
  const ChickenSpawning(this.name);

  static const ChickenSpawning overworld = ChickenSpawning("overworld");
  static const ChickenSpawning nether = ChickenSpawning("nether");
  static const ChickenSpawning none = ChickenSpawning("none");

}

class ChickenBase extends Widget{

  String name;
  List<Item> drops = [];
  Entity _entity;
  List<String> _tags;
  ChickenSpawning spawning;
  String texture;
  int model;
  int dropCooldown;
  static List<ChickenBase> chickens;
  static int chickensModelCounter = 1000;
  static String drop_score = "bc_drop";

  ChickenBase(this.name, this.drops, {this.spawning = ChickenSpawning.none, this.dropCooldown = 9800}){
    if(chickens == null){
      chickens = [this];
    }else{
      chickens.add(this);
    }
    this.texture = name.replaceAll(" Chicken", "").replaceAll(" ", "_").toLowerCase();
    this.drops.add(Item(Items.feather,count: 1));
    this.drops.add(Item(Items.egg,count: 1));
    _tags = [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"];
    _entity = Entity(type: Entities.chicken, tags: _tags);
    model = chickensModelCounter;
    chickensModelCounter++;
    BreedingRecipe.self(this);
  }

  @override
  generate(Context context) {
    return _entity;
  }

  Entity getEntity(){
    return _entity;
  }

  Summon getSummon({bool baby = false}){
    return (baby)? Summon(Entities.chicken,tags: _tags,nbt: {"Age":-6000}) : Summon(Entities.chicken,tags: _tags);
    }

  Widget getModel(){
    return If(Condition.entity(Entity(type: Entities.chicken, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"],selector: "s")),then: [Summon(Entities.armor_stand,invulnerable: true,tags: ["bc_stand","bc_init"], nbt: {"Invisible":1,"Invulnerable":1,"NoBasePlate":1,"NoGravity":1,"Small":1,"Marker":1,"ArmorItems":[{},{},{},Item(Items.cookie,count: 1,model: model).getMap()]})]);
  }

  Widget getDrops(){
    List<Widget> summondrops = [RandomScore(Entity.Selected(),to: drops.length-1,objective: drop_score)];
    var i = 0;
    for (Item item in drops) {
      summondrops.add(If(Condition.score(Score(Entity.Selected(), drop_score).matches(i)),then: [
        Summon(Entities.item,nbt: {
        "Item":item.getMap()
      })
      ]));
      i++;
    }
    summondrops.add(Data.modify(Entity.Selected(),path: DropManager.property,modify: DataModify.set(dropCooldown)));
    return If(Condition.entity(Entity(type: Entities.chicken, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"],selector: "s")),then: summondrops);
  }

  createModelJson(){
    var json = JsonWriter.readJson("src/chickens/example.json");
    json["textures"] = {
		"particle": "chicken/"+texture,
		"texture": "chicken/"+texture
	  };
    JsonWriter.writeJson("resources/assets/minecraft/models/item/cookie/"+model.toString()+".json", json);

    var cookie = JsonWriter.readJson("resources/assets/minecraft/models/item/cookie.json");
    List<dynamic> overrides = cookie["overrides"];
    overrides.add({ "predicate": { "custom_model_data": model}, "model": "item/cookie/"+model.toString() });
    cookie["overrides"] = overrides;
    JsonWriter.writeJson("resources/assets/minecraft/models/item/cookie.json", cookie);
  }

}