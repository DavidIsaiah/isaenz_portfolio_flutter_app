import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

/// Thin wrapper around Firebase Analytics/Crashlytics (spec sections 2, 8
/// Phase 4). Safely no-ops until a real Firebase project is wired up —
/// run `flutterfire configure` to generate firebase_options.dart and the
/// native config files, then pass the generated options to
/// Firebase.initializeApp() in main.dart.
class AnalyticsService {
  AnalyticsService._();

  static bool _ready = false;

  static void markReady() => _ready = true;

  static bool get isReady => _ready;

  static Future<void> logScreenView(String screenName) async {
    if (!_ready) return;
    await FirebaseAnalytics.instance.logScreenView(screenName: screenName);
  }

  static Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    if (!_ready) return;
    await FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters);
  }

  static void recordError(Object error, StackTrace? stack, {bool fatal = false}) {
    if (!_ready) {
      debugPrint('AnalyticsService (Firebase not configured): $error');
      return;
    }
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: fatal);
  }
}

/// Logs a screen_view event on every named route push, using the GoRoute
/// `name` as the screen name. No-ops until [AnalyticsService.markReady].
class AnalyticsRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _log(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _log(newRoute);
  }

  void _log(Route<dynamic> route) {
    final name = route.settings.name;
    if (name != null && name.isNotEmpty) {
      AnalyticsService.logScreenView(name);
    }
  }
}
