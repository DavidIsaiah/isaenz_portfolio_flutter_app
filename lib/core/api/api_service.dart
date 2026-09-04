import 'package:dio/dio.dart';

import 'api_client.dart';

/// Thin wrapper around the Dio client mapping directly to the Spring Boot
/// endpoints defined in the tech spec (section 4).
class ApiService {
  ApiService(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get('/profile');
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getProjects({String? category}) async {
    final response = await _dio.get(
      '/projects',
      queryParameters: category != null ? {'category': category} : null,
    );
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> getProjectById(String id) async {
    final response = await _dio.get('/projects/$id');
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getExperience() async {
    final response = await _dio.get('/experience');
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getSkills() async {
    final response = await _dio.get('/skills');
    return response.data as List<dynamic>;
  }
}

final apiServiceInstance = ApiService(ApiClient.instance.dio);
