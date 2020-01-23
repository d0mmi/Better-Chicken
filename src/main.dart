import 'package:objd/core.dart';
import 'dart:io';

import './manager/BreedingManager.dart';
import './manager/DropManager.dart';
import 'chickens/ChickenBase.dart';
import 'chickens/breeding/BreedingRecipe.dart';
import 'manager/AdvancementManager.dart';
import 'manager/ModelManager.dart';
import 'manager/NaturalSpawningManager.dart';
import 'tools/analyse_tool.dart';
import 'utils/builder.dart';

void main(args){
  print("PreBuild:");
  BuilderHelper.preBuild();
  print("Build:");
	createProject(
		Project(
			name:"better_chicken",
			target:"./",
			generate: MainWidget(),
      description: "{\"pack\": {\"pack_format\": 1, \"description\": \"Better Chicken Datapack by D0mmi\"}}"
		),args
	);
  Future.delayed(Duration(seconds: 3),()=>{
    print("PostBuild:"),
    BuilderHelper.postBuild(copy: true)
  });
}

class MainWidget extends Widget {

	@override
	Widget generate(Context context){

    //Overworld
    ChickenBase log = ChickenBase("Log Chicken", [Item(Items.acacia_log,count: 1),Item(Items.birch_log,count: 1),Item(Items.jungle_log,count: 1),Item(Items.oak_log,count: 1),Item(Items.spruce_log,count: 1),Item(Items.dark_oak_log,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase sand = ChickenBase("Sand Chicken", [Item(Items.sand,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase flint = ChickenBase("Flint Chicken", [Item(Items.flint,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase bone = ChickenBase("Bone Chicken", [Item(Items.bone,count: 1)], spawning: ChickenSpawning.overworld);
    
    //Nether
    ChickenBase soul = ChickenBase("Soul Chicken", [Item(Items.soul_sand,count: 1)], spawning: ChickenSpawning.nether);
    ChickenBase quartz = ChickenBase("Quartz Chicken", [Item(Items.quartz,count: 1)], spawning: ChickenSpawning.nether);

    //Dye
    ChickenBase red = ChickenBase("Red Chicken", [Item(Items.red_dye,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase white = ChickenBase("White Chicken", [Item(Items.white_dye,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase blue = ChickenBase("Blue Chicken", [Item(Items.blue_dye,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase yellow = ChickenBase("Yellow Chicken", [Item(Items.yellow_dye,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase green = ChickenBase("Green Chicken", [Item(Items.green_dye,count: 1)], spawning: ChickenSpawning.overworld);
    ChickenBase black = ChickenBase("Black Chicken", [Item(Items.black_dye,count: 1)], spawning: ChickenSpawning.overworld);

    ChickenBase pink = ChickenBase("Pink Chicken", [Item(Items.pink_dye,count: 1)]);
    ChickenBase purple = ChickenBase("Purple Chicken", [Item(Items.purple_dye,count: 1)]);
    ChickenBase orange = ChickenBase("Orange Chicken", [Item(Items.orange_dye,count: 1)]);
    ChickenBase light_gray = ChickenBase("Light Gray Chicken", [Item(Items.light_gray_dye,count: 1)]);
    ChickenBase cyan = ChickenBase("Cyan Chicken", [Item(Items.cyan_dye,count: 1)]);
    ChickenBase gray = ChickenBase("Gray Chicken", [Item(Items.gray_dye,count: 1)]);
    ChickenBase lime = ChickenBase("Lime Chicken", [Item(Items.lime_dye,count: 1)]);
    ChickenBase light_blue = ChickenBase("Light Blue Chicken", [Item(Items.light_blue_dye,count: 1)]);
    ChickenBase magenta = ChickenBase("Magenta Chicken", [Item(Items.magenta_dye,count: 1)]);
    ChickenBase brown = ChickenBase("Brown Chicken", [Item(Items.brown_dye,count: 1)]);

    //Material Chicken
    ChickenBase coal = ChickenBase("Coal Chicken", [Item(Items.coal,count: 1)]);
    ChickenBase iron = ChickenBase("Iron Chicken", [Item(Items.iron_ingot,count: 1)]);
    ChickenBase gunpowder = ChickenBase("Gunpowder Chicken", [Item(Items.gunpowder,count: 1)]);
    ChickenBase redstone = ChickenBase("Redstone Chicken", [Item(Items.redstone,count: 1)]);
    ChickenBase glass = ChickenBase("Glass Chicken", [Item(Items.glass,count: 1)]);
    ChickenBase glowstone = ChickenBase("Glowstone Chicken", [Item(Items.glowstone,count: 1)]);
    ChickenBase string = ChickenBase("String Chicken", [Item(Items.string,count: 1)]);
    ChickenBase gold = ChickenBase("Gold Chicken", [Item(Items.gold_ingot,count: 1)]);
    ChickenBase snow = ChickenBase("Snow Chicken", [Item(Items.snowball,count: 1)]);
    ChickenBase water = ChickenBase("Water Chicken", [Item(Items.water_bucket,count: 1)]);
    ChickenBase lava = ChickenBase("Lava Chicken", [Item(Items.lava_bucket,count: 1)]);
    ChickenBase clay = ChickenBase("Clay Chicken", [Item(Items.clay_ball,count: 1)]);
    ChickenBase leather = ChickenBase("Leather Chicken", [Item(Items.leather,count: 1)]);
    ChickenBase wart = ChickenBase("Wart Chicken", [Item(Items.nether_wart,count: 1)]);
    ChickenBase diamond = ChickenBase("Diamond Chicken", [Item(Items.diamond,count: 1)]);
    ChickenBase blaze = ChickenBase("Blaze Chicken", [Item(Items.blaze_rod,count: 1)]);
    ChickenBase slime = ChickenBase("Slime Chicken", [Item(Items.slime_ball,count: 1)]);
    ChickenBase magma = ChickenBase("Magma Chicken", [Item(Items.magma_cream,count: 1)]);
    ChickenBase emerald = ChickenBase("Emerald Chicken", [Item(Items.emerald,count: 1)]);
    ChickenBase ghast = ChickenBase("Ghast Chicken", [Item(Items.ghast_tear,count: 1)]);
    ChickenBase ender = ChickenBase("Ender Chicken", [Item(Items.ender_pearl,count: 1)]);
    ChickenBase xp = ChickenBase("XP Chicken", [Item(Items.experience_bottle,count: 1)]);
    ChickenBase prismarine_shard = ChickenBase("Prismarine Shard Chicken", [Item(Items.prismarine_shard,count: 1)]);
    ChickenBase prismarine = ChickenBase("Prismarine Chicken", [Item(Items.prismarine,count: 1)]);

    //Breeding

    //Coloured
    BreedingRecipe(red,white,pink);
    BreedingRecipe(blue,red,purple);
    BreedingRecipe(red,yellow,orange);
    BreedingRecipe(gray,white,light_gray);
    BreedingRecipe(blue,green,cyan);
    BreedingRecipe(black,white,gray);
    BreedingRecipe(green,white,lime);
    BreedingRecipe(white,blue,light_blue);
    BreedingRecipe(purple,pink,magenta);
    BreedingRecipe(red,green,brown);

    //Material 
    BreedingRecipe(flint,log,coal);
    BreedingRecipe(flint,white,iron);
    BreedingRecipe(flint,sand,gunpowder);
    BreedingRecipe(red,sand,redstone);
    BreedingRecipe(quartz,redstone,glass);
    BreedingRecipe(quartz,yellow,glowstone);
    BreedingRecipe(black,log,string);

    BreedingRecipe(iron,yellow,gold);
    BreedingRecipe(blue,log,snow);
    BreedingRecipe(snow,gunpowder,water);
    BreedingRecipe(coal,quartz,lava);
    BreedingRecipe(snow,sand,clay);
    BreedingRecipe(brown,string,leather);
    BreedingRecipe(brown,glowstone,wart);

    BreedingRecipe(gold,glass,diamond);
    BreedingRecipe(gold,lava,blaze);
    BreedingRecipe(clay,green,slime);

    BreedingRecipe(blaze,slime,magma);
    BreedingRecipe(diamond,green,emerald);
    BreedingRecipe(blaze,white,ghast);
    BreedingRecipe(diamond,wart,ender);

    BreedingRecipe(emerald,green,xp);
    BreedingRecipe(blue,water,prismarine_shard);
    BreedingRecipe(water,emerald,prismarine);

    List<File> summonChicken = [];

    ChickenBase.chickens.forEach((chicken) => {
      summonChicken.add(File("chickens/summon_"+chicken.name.toLowerCase().replaceAll(" ", "_"),child: chicken.getSummon()))
    });


    return Pack(
		name: "better_chicken",
		main: File(
			'main',
      child: For.of([
        BreedingManager(),
        DropManager(),
        NaturalSpawningManager(),
        ModelManager(),
        AdvancementManager(),
        AnalyseTool()
      ])
		),
    load: File(
      'load',
      child: For.of([
        Tellraw(Entity.All(),show: [TextComponent("Better Chickens v0.1 by ",color: Color.Gold),TextComponent("D0mmi",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi")),TextComponent(" Loaded!",color: Color.Gold)]),
        Tellraw(Entity.All(),show: [TextComponent("Submit Bugs or Suggestions ",color: Color.Gold),TextComponent("here!",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi/Better-Chicken/issues/new"))]),
      ])
    ),
    files: summonChicken
	);
  }
}