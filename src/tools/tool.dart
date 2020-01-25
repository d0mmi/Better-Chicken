import 'package:objd/core.dart';

class Tool extends Widget{

  String name;
  int model;
  Item tool;
  List<Item> crafting;
  List<Widget> onUse;
  static Entity chicken = Entity(type: Entities.chicken, tags: ["better_chicken"],distance: Range(to: 0.5));
  static List<Tool> tools;

  Tool(this.name,this.model,this.crafting,this.onUse){
    if(tools == null){
      tools = [this];
    }else{
      tools.add(this);
    }
    tool = Item(Items.carrot_on_a_stick,model: model,count: 1);
  }

  @override
  generate(Context context) {
    var ray = Raycast(Entity.Selected(),max: 3,step: 0.1,ray: (stop, hit) => For.of([
       If(Condition.entity(chicken),then:[hit()])
    ]),onhit: onUse);
    return File.execute("/tool/"+name.toLowerCase().replaceAll(" ", "_"),child: For.of([ClickEvent(selectedItem: tool,onClick: ray),Execute.asat(Entity(type: Entities.chicken, tags: ["better_chicken"]),children: [getCrafting()])]));
  }

  Widget getCrafting(){
    List<Condition> conditions = [];
    List<Widget> then = [];
    for (var item in crafting) {
      var item_nbt = {"Item":{
        "id":item.type.toString(),
        "Count":gsonDecode(item.count.toString()+"b")
      }};
      var entity = Entity(type: Entities.item,distance: Range(to: 0.2),nbt: item_nbt);
      conditions.add(Condition.entity(entity));
      then.add(Kill(entity));
    }
    then.add(Summon(Entities.item,nbt: {"Item":Item(Items.carrot_on_a_stick,model: model,name: TextComponent(name),count: 1).getMap() }));
    return If(Condition.and(conditions),then: then);
  }

}