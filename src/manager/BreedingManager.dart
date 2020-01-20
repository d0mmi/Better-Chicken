import 'package:objd/core.dart';

import '../chickens/breeding/BreedingRecipe.dart';

class BreedingManager extends Widget{

  static Entity chicken = Entity(type: EntityType.chicken,tags: ["better_chicken"]);
  static String lovescore = "inlove";
  static String property = "InLove";

  @override
  generate(Context context) {

    List<Widget> onLove = [];
    onLove.addAll(BreedingRecipe.recipes);
    onLove.addAll([
      Tag(lovescore,entity: Entity.Selected(),value: false),
    ]);

    return File.execute("breeding_manager",child: For.of([
      Scoreboard(lovescore),
      Execute.asat(chicken,children: [
        If(Condition.tag(Tag(lovescore,entity: Entity.Selected(),value: true)),Then: onLove),
        Command("execute as @s store result score @s "+ lovescore + " run data get entity @s " + property),
        If(Condition.predicate("better_chicken:inlove"),Then: [
          Tag(lovescore,entity: Entity.Selected(),value: true)
        ])
      ])
    ]));
  }
}