import 'dart:io';

void main() {
  final directory = Directory('../../../assets/');
  directory.list().forEach((FileSystemEntity entity) {
    if (entity is File) {
      print(entity.path.split('/').last);
    }
  });
}