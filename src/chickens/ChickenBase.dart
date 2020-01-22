import 'package:objd/core.dart';

import '../utils/json_writer.dart';

class ChickenBase extends Widget{

  String name;
  List<Item> drops = [];
  Entity _entity;
  List<String> _tags;
  bool natural;
  String texture;
  static List<ChickenBase> chickens;
  static int chickensModel = 1000;
  static String drop_score = "bc_drop";

  ChickenBase(this.name, this.drops,{this.natural = false,this.texture = "coal_block"}){
    if(chickens == null){
      chickens = [this];
    }else{
      chickens.add(this);
    }
    this.drops.add(Item(ItemType.feather,count: 1));
    _tags = [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"];
    _entity = Entity(type: EntityType.chicken, tags: _tags);
  }

  @override
  generate(Context context) {
    return _entity;
  }

  Entity getEntity(){
    return _entity;
  }

  Summon getSummon({bool baby = false}){
    List<Summon> passengers = [
      Summon(EntityType.armor_stand,invulnerable: true,tags: ["bc_stand"], nbt: {"Invisible":1,"NoBasePlate":1,"Small":1,"ArmorItems":[{},{},{},Item(ItemType.cookie,count: 1,model: 1).getMap()]})
    ];
    return (baby)? Summon(EntityType.chicken,tags: _tags,name: TextComponent(name),nbt: {"Age":-6000},passengers: passengers) : Summon(EntityType.chicken,tags: _tags,name: TextComponent(name),passengers: passengers);
    }

  Widget getDrops(){
    List<Widget> summondrops = [RandomScore(Entity.Selected(),to: drops.length-1,objective: drop_score)];
    var i = 0;
    for (Item item in drops) {
      summondrops.add(If(Condition.score(Score(Entity.Selected(), drop_score).matches(i)),Then: [
        Summon(EntityType.item,nbt: {
        "Item":item.getMap()
      })
      ]));
      i++;
    }
    
    return If(Condition.entity(Entity(type: EntityType.chicken, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"],selector: "s")),Then: summondrops);
  }

  createModelJson(){
    var json = JsonWriter.readJson("src/chickens/example.json");
    json["textures"] = {
		"particle": "chicken/"+texture,
		"texture": "chicken/"+texture
	  };
    JsonWriter.writeJson("resources/assets/minecraft/models/item/cookie/"+chickensModel.toString()+".json", json);

    var cookie = JsonWriter.readJson("resources/assets/minecraft/models/item/cookie.json");
    List<dynamic> overrides = cookie["overrides"];
    overrides.add({ "predicate": { "custom_model_data": chickensModel}, "model": "item/cookie/"+chickensModel.toString() });
    cookie["overrides"] = overrides;
    JsonWriter.writeJson("resources/assets/minecraft/models/item/cookie.json", cookie);

    chickensModel++;
  }

}