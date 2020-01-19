import 'package:objd/core.dart';
import './manager/BreedingManager.dart';
import './manager/DropManager.dart';

void main(){
	createProject(
		Project(
			name:"better_chicken",
			target:"./",
			generate: MainWidget(),
      description: "{\"pack\": {\"pack_format\": 1, \"description\": \"Better Chicken Datapack by D0mmi\"}}"
		)
	);
}

class MainWidget extends Widget {

	@override
	Widget generate(Context context){
    return Pack(
		name: "better_chicken",
		main: File(
			'main',
      child: For.of([
        BreedingManager(),
        DropManager()
      ])
		),
    load: File(
      'load',
      child: For.of([
        Tellraw(Entity.All(),show: [TextComponent("Better Chickens v0.1 by ",color: Color.Gold),TextComponent("D0mmi",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi")),TextComponent(" Loaded!",color: Color.Gold)]),
        Tellraw(Entity.All(),show: [TextComponent("Submit Bugs or Suggestions ",color: Color.Gold),TextComponent("here!",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi/Better-Chicken/issues/new"))]),
      ])
    )
	);
  }
}