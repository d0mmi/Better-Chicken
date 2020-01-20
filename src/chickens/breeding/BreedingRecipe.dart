import 'package:objd/core.dart';

import '../../manager/BreedingManager.dart';
import '../ChickenBase.dart';

class BreedingRecipe extends Widget{

  ChickenBase chicken1;
  ChickenBase chicken2;
  ChickenBase chickenResult;
  static List<BreedingRecipe> recipes;

  BreedingRecipe(this.chicken1, this.chicken2, this.chickenResult){
    if(recipes == null){
      recipes = [this];
    }else{
      recipes.add(this);
    }
  }

  @override
  generate(Context context) {
    List<String> tags =  [];
    (chicken2.getEntity().arguments['tag'] as List<dynamic>).forEach((tag)=>{
      if(tag is String){
        tags.add(tag)
      }else if(tag is Tag){
        tags.add(tag.tag)
      }
    });
    tags.add(BreedingManager.lovescore);
    var near_chicken2 = chicken2.getEntity().copyWith(distance: Range(to: 3),tags: tags);
    near_chicken2.selector = "e";
    var if_chicken1 = chicken1.getEntity();
    if_chicken1.selector = "s";

    return For.of([
      If(Condition.entity(if_chicken1),Then: [
        If(Condition.entity(near_chicken2),Then: [
          chickenResult.getSummon(baby: true),
          Data.modify(Entity.Selected(),path: BreedingManager.property, modify: DataModify.set(0)),
          Data.modify(near_chicken2.copyWith(limit: 1),path: BreedingManager.property, modify: DataModify.set(0))
        ])
      ])
    ]);
  }

}