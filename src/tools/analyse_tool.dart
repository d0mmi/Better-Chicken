import 'package:objd/core.dart';
import '../chickens/ChickenBase.dart';
import 'tool.dart';

class AnalyseTool extends Tool {
  AnalyseTool() : super("Chicken Lens", 1, [
    Item(Items.oak_log,count: 1),
    Item(Items.book,count: 1),
    Item(Items.light_blue_stained_glass_pane,count: 1)
  ], [
    If(Condition.entity(Tool.chicken),then: [
      Tellraw(Entity.Selected(),show: [TextComponent("[--------------------------------]")]),
      For.of(getChickenInfo()),
      Tellraw(Entity.Selected(),show: [TextComponent("  Chickendrop Timer: "),TextComponent.score(Score(Tool.chicken,"chickendrop"))]),
      Tellraw(Entity.Selected(),show: [TextComponent("[--------------------------------]")]),
    ]),
    
  ]);

  static List<Widget> getChickenInfo(){
    List<Widget> cmds = [];
    for (var chicken in ChickenBase.chickens) {
      List<Widget> drops = [];
      for (var item in chicken.drops) {
        drops.add(Tellraw(Entity.Selected(),show: [TextComponent("    - "+item.count.toString()+"x "+formatItems(item.type))]));
      }
      cmds.add(If(Condition.entity(chicken.getEntity().copyWith(distance: Range(to: 1))),then: [
        Tellraw(Entity.Selected(),show: [TextComponent("  Chicken Type: " + chicken.name)]),
        Tellraw(Entity.Selected(),show: [TextComponent("")]),
        Tellraw(Entity.Selected(),show: [TextComponent("  Drop Cooldown: " + formatCooldown(chicken.dropCooldown))]),
        Tellraw(Entity.Selected(),show: [TextComponent("  Chicken Drops:")]),
        For.of(drops)
      ]));
    }
    return cmds;
  }
  static String formatItems(dynamic type){
    String result = type.toString();
    result = result.replaceAll("minecraft:", "");
    result = result.replaceAll("_", " ");

    return result;
  }
  static String formatCooldown(int ticks){
    int m = ticks ~/ (20*60);
    int s = ticks % (60);
    String min = (m > 0)? (m.toString()+"m "):"";
    String sec = (s > 0)? (s.toString()+"s "):"";

    return min + sec +"("+ticks.toString()+" ticks)";
  }
}
