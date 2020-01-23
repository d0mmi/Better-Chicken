import 'package:objd/core.dart';
import 'package:objd/external/predicates/entity/scores.dart';


import '../chickens/breeding/BreedingRecipe.dart';

class BreedingManager extends Widget{

  static Entity chicken = Entity(type: Entities.chicken,tags: ["better_chicken"]);
  static String lovescore = "inlove";
  static String property = "InLove";

  @override
  generate(Context context) {

    List<Widget> onLove = [];
    onLove.addAll(BreedingRecipe.selfRecipes);
    onLove.addAll(BreedingRecipe.recipes);
    onLove.addAll([
      Tag(lovescore,entity: Entity.Selected(),value: false),
    ]);
    return File.execute("breeding_manager",child: For.of([
      Scoreboard(lovescore),
      Execute.asat(chicken,children: [
        If(Condition.tag(Tag(lovescore,entity: Entity.Selected(),value: true)),then: onLove),
        Command("execute as @s store result score @s "+ lovescore + " run data get entity @s " + property),
        If(Condition.predicate(Predicate("inlove",contents: Scores({"inlove":Range(from: 100, to: 600)}))),then: [
          Tag(lovescore,entity: Entity.Selected(),value: true)
        ])
      ])
    ]));
  }
}