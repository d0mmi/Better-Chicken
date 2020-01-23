import 'package:objd/core.dart';

import '../chickens/ChickenBase.dart';

class AdvancementManager extends Widget{
  @override
  generate(Context context) {
    List<Widget> list = [];

    for(var chicken in ChickenBase.chickens){
      list.add(
        If(Condition.entity(chicken.getEntity().copyWith(distance: Range(to: 3))),assignTag: Entity.Selected(),then: [
          Advancement.only(Entity.Selected(), "better_chicken:"+chicken.name.toLowerCase().replaceAll(" ", "_"))
        ])
      );
    }

    return File.execute("advancement_manager",child: Execute.asat(Entity.Player(),children: list));
  }
  
}