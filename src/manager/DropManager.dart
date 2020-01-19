import 'package:objd/core.dart';

import '../chickens/ChickenBase.dart';

class DropManager extends Widget{

  Entity chicken = Entity(type: EntityType.chicken,tags: ["better_chicken"]);
  String dropscore = "chickendrop";
  String property = "EggLayTime";

  @override
  generate(Context context) {

    List<Widget> drops = [];

    for (var chicken in ChickenBase.chickens) {
      drops.add(chicken.getDrops());
    }

    return File.execute("drop_manager",child: For.of([
      Scoreboard(dropscore),
      Execute.asat(chicken,children: [
        Command("execute as @s store result score @s "+ dropscore + " run data get entity @s " + property),
        If(Condition.predicate("better_chicken:chickendrop"),Then: [
          Say("Drop"),
          For.of(drops),
          Data.modify(Entity.Selected(),path: property,modify: DataModify.set(9800))
          //Data.modify(Entity.Selected(),path: property,modify: DataModify.set(60))
        ])
      ])
    ]));
  }
}