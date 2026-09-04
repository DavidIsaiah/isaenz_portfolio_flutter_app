import 'package:hive_flutter/hive_flutter.dart';

/// Offline-first local cache. Boxes store raw JSON so the same models
/// power both the live API path and the cached fallback path.
class HiveService {
  HiveService._();

  static const String profileBox = 'profile_box';
  static const String projectsBox = 'projects_box';
  static const String experienceBox = 'experience_box';
  static const String skillsBox = 'skills_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(profileBox),
      Hive.openBox(projectsBox),
      Hive.openBox(experienceBox),
      Hive.openBox(skillsBox),
    ]);
  }

  static Box box(String name) => Hive.box(name);
}
