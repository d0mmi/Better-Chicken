import 'package:objd/core.dart';
import './manager/BreedingManager.dart';
import './manager/DropManager.dart';
import 'chickens/ChickenBase.dart';
import 'chickens/breeding/BreedingRecipe.dart';

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

    //Overworld
    ChickenBase log = new ChickenBase("Log Chicken", [Item(ItemType.acacia_log,count: 1),Item(ItemType.birch_log,count: 1),Item(ItemType.jungle_log,count: 1),Item(ItemType.oak_log,count: 1),Item(ItemType.spruce_log,count: 1),Item(ItemType.dark_oak_log,count: 1)], natural: true);
    ChickenBase sand = new ChickenBase("Sand Chicken", [Item(ItemType.sand,count: 1)], natural: true);
    ChickenBase flint = new ChickenBase("Flint Chicken", [Item(ItemType.flint,count: 1)], natural: true);
    ChickenBase bone = new ChickenBase("Bone Chicken", [Item(ItemType.bone,count: 1)], natural: true);
    
    //Nether
    ChickenBase soul = new ChickenBase("Soul Chicken", [Item(ItemType.soul_sand,count: 1)], natural: true);
    ChickenBase quartz = new ChickenBase("Quartz Chicken", [Item(ItemType.quartz,count: 1)], natural: true);

    //Dye
    ChickenBase red = new ChickenBase("Red Chicken", [Item(ItemType.red_dye,count: 1)], natural: true);
    ChickenBase white = new ChickenBase("White Chicken", [Item(ItemType.white_dye,count: 1)], natural: true);
    ChickenBase blue = new ChickenBase("Blue Chicken", [Item(ItemType.blue_dye,count: 1)], natural: true);
    ChickenBase yellow = new ChickenBase("Yellow Chicken", [Item(ItemType.yellow_dye,count: 1)], natural: true);
    ChickenBase green = new ChickenBase("Green Chicken", [Item(ItemType.green_dye,count: 1)], natural: true);
    ChickenBase black = new ChickenBase("Black Chicken", [Item(ItemType.black_dye,count: 1)], natural: true);

    ChickenBase pink = new ChickenBase("Pink Chicken", [Item(ItemType.pink_dye,count: 1)]);
    ChickenBase purple = new ChickenBase("Purple Chicken", [Item(ItemType.purple_dye,count: 1)]);
    ChickenBase orange = new ChickenBase("Orange Chicken", [Item(ItemType.orange_dye,count: 1)]);
    ChickenBase light_grey = new ChickenBase("Light Grey Chicken", [Item(ItemType.light_gray_dye,count: 1)]);
    ChickenBase cyan = new ChickenBase("Cyan Chicken", [Item(ItemType.cyan_dye,count: 1)]);
    ChickenBase grey = new ChickenBase("Grey Chicken", [Item(ItemType.gray_dye,count: 1)]);
    ChickenBase lime = new ChickenBase("Lime Chicken", [Item(ItemType.lime_dye,count: 1)]);
    ChickenBase light_blue = new ChickenBase("Light Blue Chicken", [Item(ItemType.light_blue_dye,count: 1)]);
    ChickenBase magenta = new ChickenBase("Magenta Chicken", [Item(ItemType.magenta_dye,count: 1)]);
    ChickenBase brown = new ChickenBase("Brown Chicken", [Item(ItemType.brown_dye,count: 1)]);

    //Material Chicken
    ChickenBase coal = new ChickenBase("Coal Chicken", [Item(ItemType.charcoal,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase iron = new ChickenBase("Iron Chicken", [Item(ItemType.iron_ingot,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase gunpowder = new ChickenBase("Gunpowder Chicken", [Item(ItemType.gunpowder,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase redstone = new ChickenBase("Redstone Chicken", [Item(ItemType.redstone,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase glass = new ChickenBase("Glass Chicken", [Item(ItemType.glass,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase glowstone = new ChickenBase("Glowstone Chicken", [Item(ItemType.glowstone,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase string = new ChickenBase("String Chicken", [Item(ItemType.string,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase gold = new ChickenBase("Gold Chicken", [Item(ItemType.gold_ingot,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase snow = new ChickenBase("Snow Chicken", [Item(ItemType.snowball,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase water = new ChickenBase("Water Chicken", [Item(ItemType.water_bucket,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase lava = new ChickenBase("Lava Chicken", [Item(ItemType.lava_bucket,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase clay = new ChickenBase("Clay Chicken", [Item(ItemType.clay_ball,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase leather = new ChickenBase("Leather Chicken", [Item(ItemType.leather,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase wart = new ChickenBase("Wart Chicken", [Item(ItemType.nether_wart,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase diamond = new ChickenBase("Diamond Chicken", [Item(ItemType.diamond,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase blaze = new ChickenBase("Blaze Chicken", [Item(ItemType.blaze_rod,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase slime = new ChickenBase("Slime Chicken", [Item(ItemType.slime_ball,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase magma = new ChickenBase("Magma Chicken", [Item(ItemType.magma_cream,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase emerald = new ChickenBase("Emerald Chicken", [Item(ItemType.emerald,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase ghast = new ChickenBase("Ghast Chicken", [Item(ItemType.ghast_tear,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase ender = new ChickenBase("Ender Chicken", [Item(ItemType.ender_pearl,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase xp = new ChickenBase("XP Chicken", [Item(ItemType.experience_bottle,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase prismarine_shard = new ChickenBase("Prismarine Shard Chicken", [Item(ItemType.prismarine_shard,count: 1),Item(ItemType.feather,count: 1)]);
    ChickenBase prismarine = new ChickenBase("Prismarine Chicken", [Item(ItemType.prismarine,count: 1),Item(ItemType.feather,count: 1)]);

    //Breeding

    //Coloured
    BreedingRecipe(red,white,pink);
    BreedingRecipe(blue,red,purple);
    BreedingRecipe(red,yellow,orange);
    BreedingRecipe(grey,white,light_grey);
    BreedingRecipe(blue,green,cyan);
    BreedingRecipe(black,white,grey);
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
        For.of(summonChicken)
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