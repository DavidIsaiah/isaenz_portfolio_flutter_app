import 'package:dio/dio.dart';

import '../../../core/api/api_service.dart';
import '../../../core/cache/hive_service.dart';
import '../models/profile.dart';
import 'profile_seed_data.dart';

/// Fetches profile data from the API, falling back to the last cached
/// response and finally to bundled seed data when offline / pre-launch.
class ProfileRepository {
  ProfileRepository(this._api);

  final ApiService _api;
  static const _cacheKey = 'profile';

  Future<Profile> getProfile() async {
    final box = HiveService.box(HiveService.profileBox);
    try {
      final json = await _api.getProfile();
      await box.put(_cacheKey, json);
      return Profile.fromJson(json);
    } on DioException {
      final cached = box.get(_cacheKey) as Map?;
      if (cached != null) {
        return Profile.fromJson(Map<String, dynamic>.from(cached));
      }
      return profileSeed;
    }
  }
}

final profileRepository = ProfileRepository(apiServiceInstance);
