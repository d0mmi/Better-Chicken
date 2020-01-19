import 'package:objd/core.dart';

class ChickenBase extends Widget{

  String name;
  List<Item> drops = [];
  static List<ChickenBase> chickens;

  ChickenBase(this.name, this.drops){
    if(chickens == null){
      chickens = [this];
    }else{
      chickens.add(this);
    }
  }

  @override
  generate(Context context) {
    return Entity(type: EntityType.chicken, name: name, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"]);
  }

  Widget getDrops(){
    List<Summon> summondrops = [];
    for (Item item in drops) {
      summondrops.add(Summon(EntityType.item,nbt: {
        "Item":item.getMap()
      }));
    }

    return If(Condition.entity(Entity(type: EntityType.chicken, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"],selector: "s")),Then: summondrops);
  }

}