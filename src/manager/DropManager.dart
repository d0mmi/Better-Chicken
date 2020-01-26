import 'package:objd/core.dart';
import 'package:objd/external/predicates/entity/scores.dart';

import '../chickens/ChickenBase.dart';

class DropManager extends Widget{

  static Entity chicken = Entity(type: Entities.chicken,tags: ["better_chicken"]);
  static String property = "EggLayTime";

  @override
  generate(Context context) {

    List<Widget> drops = [];

    for (var chicken in ChickenBase.chickens) {
      drops.add(chicken.getDrops());
    }

    return File.execute("drop_manager",child: For.of([
      Scoreboard(ChickenBase.drop_score),
      Execute.asat(chicken,children: [
        Command("execute as @s store result score @s "+ ChickenBase.drop_score + " run data get entity @s " + property),
        If(Condition.predicate(Predicate("better_chicken:chickendrop",contents: Scores({ChickenBase.drop_score:Range(from: 10, to: 30)}))),then: [
          For.of(drops)
        ])
      ])
    ]));
  }
}