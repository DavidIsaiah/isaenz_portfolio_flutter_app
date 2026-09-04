class RoutePaths {
  RoutePaths._();

  static const splash = '/splash';
  static const home = '/home';
  static const projects = '/projects';
  static const projectDetail = '/projects/:id';
  static const experience = '/experience';
  static const skills = '/skills';
  static const contact = '/contact';

  static String projectDetailPath(String id) => '/projects/$id';
}
