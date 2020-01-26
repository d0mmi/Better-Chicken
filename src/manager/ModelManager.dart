import 'package:objd/core.dart';

import '../chickens/ChickenBase.dart';

class ModelManager extends Widget{

  static Entity chicken = Entity(type: Entities.chicken,tags: ["better_chicken"]);
  static Entity select_chicken = chicken.copyWith(scores: [Score(Entity.Selected(), "bc_id").matches(0)],limit: 1);
  static Entity check_chicken = chicken.copyWith(scores: [Score(Entity.Selected(), "bc_id").matches(0)]);
  static Entity select_stand = Entity.Select(Selector(type: Entities.armor_stand,tags: ["bc_stand","bc_init"],limit: 1,sorting: Sort.nearest,distance: Range(to: 1)));
  static Entity ground_stand = Entity(type: Entities.armor_stand,tags: ["bc_stand"],nbt: {"OnGround":1});
  static Entity stand = Entity(type: Entities.armor_stand,tags: ["bc_stand","!bc_init"]);

  @override
  generate(Context context) {
    List<Widget> models = [];

    for (var chicken in ChickenBase.chickens) {
      models.add(chicken.getModel());
    }
    return File.execute("model_manager",child: For.of([
      Execute.asat(chicken.copyWith(nbt: {"Age":0}),children: [
        If(Condition.not(Condition.score(Score(Entity.Selected(),"bc_id").matchesRange(Range(from: 1)))),then: [
        Score(Entity.PlayerName("#max"),"bc_id").add(1),
        Score(Entity.Selected(),"bc_id").addScore( Score(Entity.PlayerName("#max"),"bc_id")),
        For.of(models),
        Execute.asat(select_stand,children: [
          Score(Entity.Selected(),"bc_id").addScore( Score(Entity.PlayerName("#max"),"bc_id")),
          Tag("bc_init",entity: Entity.Selected(),value: false)
        ])
      ]),
      ]),
      Execute.asat(stand,children: [
        Score(chicken,"bc_id").subtractScore(Score(Entity.Selected(),"bc_id")),
        Tp.entity(Entity.Selected(),to: select_chicken),
        If(Condition.not(Condition.entity(check_chicken)),assignTag: Entity.Selected(), then: [
          Score(chicken,"bc_id").addScore(Score(Entity.Selected(),"bc_id")),
          Kill(Entity.Selected())
        ],orElse: [
          Data.modify(Entity.Selected(),path: "Rotation",modify: DataModify.set(select_chicken,fromPath: "Rotation")),
          Score(chicken,"bc_id").addScore(Score(Entity.Selected(),"bc_id")),
        ]),
      ]),
    ]));
  }
}