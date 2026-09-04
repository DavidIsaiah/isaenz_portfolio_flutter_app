import 'package:dio/dio.dart';

/// Base URL for the Spring Boot backend (see tech spec section 4).
/// Overridable at build time: --dart-define=API_BASE_URL=https://...
const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://api.saenzsoftware.com/api/v1',
);

class ApiClient {
  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {'Accept': 'application/json'},
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          // Centralized error logging hook — wire to Crashlytics in Phase 4.
          handler.next(error);
        },
      ),
    );
  }

  static final ApiClient instance = ApiClient._internal();

  late final Dio _dio;

  Dio get dio => _dio;
}
