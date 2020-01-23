import 'package:objd/core.dart';

import '../chickens/ChickenBase.dart';

class NaturalSpawningManager extends Widget{
  String tag = "better_chicken";
  String tag_disabled = "bc_disabled";

  @override
  generate(Context context) {


    List<String> tags = ["!"+tag,"!"+tag_disabled];
    Entity entity = Entity(type: Entities.chicken,tags: tags,distance: Range(from: 0));
    List<ChickenBase> overworld = [];
    List<ChickenBase> nether = [];

    for (var chicken in ChickenBase.chickens) {
      if(chicken.spawning.name == ChickenSpawning.overworld.name){
        overworld.add(chicken);
      }else if(chicken.spawning.name == ChickenSpawning.nether.name){
        nether.add(chicken);
      }
    }

    List<Widget> overworld_cmds = [Tag(tag_disabled,entity: Entity.Selected(),value: true),RandomScore(Entity.Selected(),to: (overworld.length - 1)*2,objective: "bc_spawn")];

    for (var i = 0; i < overworld.length; i++) {
      var chicken = overworld[i];
      overworld_cmds.add(If(Condition.score(Score(Entity.Selected(), "bc_spawn").matches(i)),then: [
        Command("/function better_chicken:chickens/summon_"+chicken.name.toLowerCase().replaceAll(" ", "_")),
        Tp(Entity.Selected(),to: Location.rel(y: -1000))
      ]));
    }

    List<Widget> nether_cmds = [Tag(tag_disabled,entity: Entity.Selected(),value: true),RandomScore(Entity.Selected(),to: (nether.length - 1)*2,objective: "bc_spawn")];

    for (var i = 0; i < nether.length; i++) {
      var chicken = nether[i];
      nether_cmds.add(If(Condition.score(Score(Entity.Selected(), "bc_spawn").matches(i)),then: [
        Command("/function better_chicken:chickens/summon_"+chicken.name.toLowerCase().replaceAll(" ", "_")),
        Command("/tp @s ~ -5 ~")
      ]));
    }

    return File.execute("natural_spawning_manager",child: For.of([
      Execute.dimension(Dimension.overworld,children: [
        Execute.asat(entity,children: overworld_cmds)
      ]),
      Execute.dimension(Dimension.the_nether,children: [
        Execute.asat(entity,children: nether_cmds)
      ]),
    ]));
  }
  
}