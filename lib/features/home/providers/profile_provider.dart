import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/profile_repository.dart';
import '../models/profile.dart';

final profileProvider = FutureProvider<Profile>((ref) {
  return profileRepository.getProfile();
});
