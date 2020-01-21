import 'dart:io';
import 'package:path/path.dart' as path;

void copyDirectory(Directory source, Directory destination) =>
       source.listSync(recursive: false)
          .forEach((var entity) {
            if (entity is Directory) {
              var newDirectory = Directory(path.join(destination.absolute.path, path.basename(entity.path)));
              newDirectory.createSync(recursive: true);
              
              copyDirectory(entity.absolute, newDirectory);
            } else if (entity is File) {
              entity.copySync(path.join(destination.path, path.basename(entity.path)));
            }
      });