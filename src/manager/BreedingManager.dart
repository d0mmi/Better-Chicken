import 'package:objd/core.dart';

class BreedingManager extends Widget{

  Entity chicken = Entity(type: EntityType.chicken,tags: ["better_chicken"]);
  String lovescore = "inlove";

  @override
  generate(Context context) {
    return File.execute("breeding_manager",child: For.of([
      Scoreboard(lovescore),
      Execute.as(chicken,children: [
        Command("execute as @s store result score @s "+ lovescore + " run data get entity @s InLove"),
        If(Condition.predicate("better_chicken:inlove"),Then: [
          Say("<3")
        ])
      ])
    ]));
  }
}