import '../models/profile.dart';

/// Local seed mirroring the future GET /api/v1/profile response.
/// Used until the Spring Boot backend is live, and as an offline fallback.
final Profile profileSeed = Profile(
  name: 'David Isaiah Saenz',
  tagline: 'Mobile · Game · Backend Developer',
  bio:
      'Full-stack and game developer with hands-on Flutter, Java/libGDX, and '
      'Spring Boot experience — from shipped iOS/Android titles to '
      'production REST APIs. Based in Queen Creek, AZ.',
  photoUrl: 'https://saenzsoftware.com/teamsupre.me/isaenz/img/profile-img.jpg',
  location: 'Queen Creek, AZ',
  usCitizen: true,
  skillChips: const ['Flutter', 'Java', 'libGDX', 'Spring Boot', 'n8n', 'Docker'],
  contactLinks: const [
    ContactLink(label: 'Email', url: 'mailto:davidisaenz114@gmail.com', type: 'email'),
    ContactLink(
      label: 'LinkedIn',
      url: 'https://linkedin.com/in/david-saenz-73045023a',
      type: 'linkedin',
    ),
    ContactLink(
      label: 'Portfolio',
      url: 'https://saenzsoftware.com/teamsupre.me/isaenz/',
      type: 'website',
    ),
    ContactLink(
      label: 'Starfall on Tapas',
      url: 'https://tapas.io/series/Starfall18/info',
      type: 'tapas',
    ),
  ],
);
