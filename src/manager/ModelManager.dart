import 'package:objd/core.dart';

class ModelManager extends Widget{

  Entity select_chicken = Entity.Select(Selector(type: Entities.chicken,tags: ["better_chicken"],limit: 1,sorting: Sort.nearest,distance: Range(to: 1)));
  Entity chicken = Entity(type: Entities.chicken,tags: ["better_chicken"]);
  Entity select_stand = Entity.Select(Selector(type: Entities.armor_stand,tags: ["bc_stand"],limit: 1,sorting: Sort.nearest,distance: Range(to: 1)));
  Entity ground_stand = Entity(type: Entities.armor_stand,tags: ["bc_stand"],nbt: {"OnGround":1});
  Entity stand = Entity(type: Entities.armor_stand,tags: ["bc_stand"]);

  @override
  generate(Context context) {
    //data modify entity @e[type=minecraft:armor_stand,limit=1] Rotation set from entity @e[type=minecraft:chicken,limit=1,sort=nearest] Rotation
    return File.execute("model_manager",child: For.of([
      Execute.asat(stand,children: [
        Data.modify(Entity.Selected(),path: "Rotation",modify: DataModify.set(select_chicken,fromPath: "Rotation"))
      ]),
      /*Execute.asat(chicken,children: [
        //Teleport(select_stand,rot: Rotation.rel(),to: Location.here()),
        Tp(select_stand,to: Location.here(), rot: Rotation.rel())
      ])*/
      Command("/kill @e[type=armor_stand,nbt=!{FallDistance:0.0f},tag=bc_stand]"),
      Command("kill @e[type=armor_stand,nbt={OnGround:1b},tag=bc_stand]")
    ]));
  }
}