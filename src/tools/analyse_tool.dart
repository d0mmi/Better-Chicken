import 'package:objd/core.dart';
import '../chickens/ChickenBase.dart';
import 'tool.dart';

class AnalyseTool extends Tool {
  AnalyseTool() : super("Analyse Tool", 1, [
    Item(ItemType.book,count: 1),
    Item(ItemType.diamond,count: 1)
  ], [
    Tellraw(Entity.Selected(),show: [TextComponent("-------------------")]),
    For.of(getChickenInfo()),
    Tellraw(Entity.Selected(),show: [TextComponent("Chickendrop Timer: "),TextComponent.score(Score(Tool.chicken,"chickendrop"))]),
    Tellraw(Entity.Selected(),show: [TextComponent("-------------------")]),
  ]);

  static List<Widget> getChickenInfo(){
    List<Widget> cmds = [];
    for (var chicken in ChickenBase.chickens) {
      List<Widget> drops = [];
      for (var item in chicken.drops) {
        drops.add(Tellraw(Entity.Selected(),show: [TextComponent("  - "+item.count.toString()+"x "+item.type.toString())]));
      }
      cmds.add(If(Condition.entity(chicken.getEntity()),Then: [
        Tellraw(Entity.Selected(),show: [TextComponent("Chicken Type: " + chicken.name)]),
        Tellraw(Entity.Selected(),show: [TextComponent("Chicken Drops:")]),
        For.of(drops)
      ]));
    }
    return cmds;
  }

}
