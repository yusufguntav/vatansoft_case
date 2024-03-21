import 'package:hive/hive.dart';

part 'preferences.g.dart';

@HiveType(typeId: 1)
class Preferences {
  Preferences({this.language, this.theme});
  @HiveField(0)
  String? language;

  @HiveField(1)
  String? theme;
}
