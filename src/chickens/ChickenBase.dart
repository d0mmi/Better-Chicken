import 'package:objd/core.dart';

class ChickenBase extends Widget{

  String name;

  @override
  generate(Context context) {
    return Entity(type: EntityType.chicken, name: name, tags: [name.toLowerCase().replaceAll(" ", "_"),"better_chicken"]);
  }
}