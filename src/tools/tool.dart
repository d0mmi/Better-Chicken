import 'package:objd/core.dart';

class Tool extends Widget{

  String name;
  int model;
  Item tool;
  List<Item> crafting;
  List<Widget> onUse;
  static Entity chicken = Entity(type: EntityType.chicken, tags: ["better_chicken"],distance: Range(to: 0.2));
  static List<Tool> tools;

  Tool(this.name,this.model,this.crafting,this.onUse){
    if(tools == null){
      tools = [this];
    }else{
      tools.add(this);
    }
    tool = Item(ItemType.carrot_on_a_stick,model: model,name: TextComponent(name));
  }

  @override
  generate(Context context) {
    var ray = Raycast(Entity.Selected(),max: 3,step: 0.1,ray: (stop, hit) => If(Condition.entity(chicken),Then:[hit()]),onhit: onUse);
    return ClickEvent(selectedItem: tool,onClick: ray);
  }

  Widget getCrafting(){
    List<Condition> conditions = [];
    List<Widget> then = [];
    for (var item in crafting) {
      var item_nbt = {"Item":item.getMap()};
      var entity = Entity(type: EntityType.item,distance: Range(to: 1),nbt: item_nbt);
      conditions.add(Condition.entity(entity));
      then.add(Kill(entity));
    }
    then.add(Summon(EntityType.item,nbt: {"Item":tool.getMap() }));
    return If(Condition.and(conditions),Then: then);
  }

}