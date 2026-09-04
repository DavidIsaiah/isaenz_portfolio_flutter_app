import 'package:go_router/go_router.dart';

import '../../features/contact/contact_screen.dart';
import '../../features/experience/experience_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/projects/project_detail_screen.dart';
import '../../features/projects/projects_screen.dart';
import '../../features/skills/skills_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'main_shell.dart';
import 'route_paths.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: RoutePaths.home, builder: (context, state) => const HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.projects,
              builder: (context, state) => const ProjectsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) =>
                      ProjectDetailScreen(projectId: state.pathParameters['id']!),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: RoutePaths.experience, builder: (context, state) => const ExperienceScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: RoutePaths.skills, builder: (context, state) => const SkillsScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: RoutePaths.contact, builder: (context, state) => const ContactScreen()),
          ],
        ),
      ],
    ),
  ],
);
