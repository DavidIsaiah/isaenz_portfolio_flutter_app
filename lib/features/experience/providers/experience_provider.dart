import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/experience_repository.dart';
import '../models/experience.dart';

final experienceProvider = FutureProvider<List<Experience>>((ref) {
  return experienceRepository.getExperience();
});
