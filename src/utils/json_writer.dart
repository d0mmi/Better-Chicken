import 'dart:convert';
import 'dart:io';

class JsonWriter{

  static Map readJson(String path){

    var file = File(path);
    String content = file.readAsStringSync();
    return jsonDecode(content);
  }

  static writeJson(String path, Map json){
    var file = File(path);
    file.writeAsStringSync(jsonEncode(json));
  }

}