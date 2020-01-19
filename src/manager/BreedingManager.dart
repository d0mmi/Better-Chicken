import 'package:objd/core.dart';

class BreedingManager extends Widget{

  Entity chicken = Entity(type: EntityType.chicken,tags: ["better_chicken"]);
  String lovescore = "inlove";
  String property = "InLove";

  @override
  generate(Context context) {
    return File.execute("breeding_manager",child: For.of([
      Scoreboard(lovescore),
      Execute.asat(chicken,children: [
        If(Condition.tag(Tag(lovescore,entity: Entity.Selected(),value: true)),Then: [
          Say("<3"),
          Tag(lovescore,entity: Entity.Selected(),value: false),
        ]),
        Command("execute as @s store result score @s "+ lovescore + " run data get entity @s " + property),
        If(Condition.predicate("better_chicken:inlove"),Then: [
          Tag(lovescore,entity: Entity.Selected(),value: true)
        ])
      ])
    ]));
  }
}