import '../models/project.dart';

/// Local seed mirroring the future GET /api/v1/projects response.
/// Used until the Spring Boot backend is live, and as an offline fallback.
final List<Project> projectsSeed = [
  const Project(
    id: 'thumbthrasher',
    title: 'ThumbThrasher',
    category: ProjectCategory.games,
    platform: 'iOS & Android',
    dateRange: 'Mar 2017 – Nov 2019',
    description:
        'A skate-inspired arcade game built with libGDX and Box2D physics, '
        'featuring Bluetooth controller support via Core Bluetooth and a '
        'RoboVM-powered iOS build alongside native Android.',
    coverImageUrl: 'https://saenzsoftware.com/teamsupre.me/isaenz/img/thumbthrasher-cover.jpg',
    galleryImages: [
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/thumbthrasher-1.jpg',
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/thumbthrasher-2.jpg',
    ],
    techStack: [
      TechStackItem(label: 'Java', group: 'Engine & Code'),
      TechStackItem(label: 'libGDX', group: 'Engine & Code'),
      TechStackItem(label: 'RoboVM', group: 'Engine & Code'),
      TechStackItem(label: 'Box2D', group: 'Engine & Code'),
      TechStackItem(label: 'Core Bluetooth', group: 'Engine & Code'),
    ],
    externalLinks: [
      ExternalLink(label: 'App Store — Pro', url: 'https://apps.apple.com/'),
      ExternalLink(label: 'App Store — Lite', url: 'https://apps.apple.com/'),
    ],
    featured: true,
  ),
  const Project(
    id: 'superquetzal',
    title: 'SuperQuetzal',
    category: ProjectCategory.games,
    platform: 'Android',
    dateRange: 'Apr 2015 – Feb 2017',
    description:
        'A 2D platformer starring a Mesoamerican-mythology hero, combining '
        'libGDX gameplay systems with hand-crafted Blender 3D assets and a '
        'reactive particle system for its title sequence.',
    coverImageUrl: 'https://saenzsoftware.com/superquetzal.com/img/cover.jpg',
    galleryImages: [
      'https://saenzsoftware.com/superquetzal.com/img/screen-1.jpg',
      'https://saenzsoftware.com/superquetzal.com/img/screen-2.jpg',
    ],
    techStack: [
      TechStackItem(label: 'Java', group: 'Engine & Code'),
      TechStackItem(label: 'libGDX', group: 'Engine & Code'),
      TechStackItem(label: 'Box2D', group: 'Engine & Code'),
      TechStackItem(label: 'Blender 3D', group: 'Art'),
      TechStackItem(label: 'Adobe Animate', group: 'Art'),
    ],
    externalLinks: [
      ExternalLink(label: 'Project Site', url: 'https://saenzsoftware.com/superquetzal.com/'),
    ],
    featured: true,
  ),
  const Project(
    id: 'ainutrix',
    title: 'AINutrix',
    category: ProjectCategory.mobileApps,
    platform: 'iOS',
    dateRange: 'Jul 2020 – Dec 2025',
    description:
        'A nutrition-tracking app pairing a Flutter/Dart client with a Yii '
        'PHP + MySQL backend, Firebase auth, and Nutritionix API integration '
        'for real-time food lookups and macro tracking.',
    coverImageUrl: 'https://saenzsoftware.com/teamsupre.me/isaenz/img/ainutrix-cover.jpg',
    galleryImages: [
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/ainutrix-1.jpg',
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/ainutrix-2.jpg',
    ],
    techStack: [
      TechStackItem(label: 'Flutter', group: 'Engine & Code'),
      TechStackItem(label: 'Dart', group: 'Engine & Code'),
      TechStackItem(label: 'Yii PHP', group: 'Backend'),
      TechStackItem(label: 'MySQL', group: 'Backend'),
      TechStackItem(label: 'Firebase', group: 'Backend'),
      TechStackItem(label: 'Nutritionix API', group: 'Backend'),
    ],
    externalLinks: [
      ExternalLink(label: 'App Store', url: 'https://apps.apple.com/'),
    ],
    featured: false,
  ),
  const Project(
    id: 'morning-star-press',
    title: 'Morning Star Press',
    category: ProjectCategory.web,
    platform: 'Web',
    dateRange: 'Jan 2026 – Mar 2026',
    description:
        'Full-stack publishing platform for an independent press, built on '
        'Spring Boot and PostgreSQL with n8n workflow automation, Dockerized '
        'deployment, and SendGrid-powered transactional email.',
    coverImageUrl: 'https://saenzsoftware.com/teamsupre.me/isaenz/img/msp-cover.jpg',
    galleryImages: [
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/msp-1.jpg',
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/msp-2.jpg',
    ],
    techStack: [
      TechStackItem(label: 'Spring Boot', group: 'Backend'),
      TechStackItem(label: 'PostgreSQL', group: 'Backend'),
      TechStackItem(label: 'n8n', group: 'Backend'),
      TechStackItem(label: 'Docker', group: 'Backend'),
      TechStackItem(label: 'SendGrid', group: 'Backend'),
    ],
    externalLinks: [
      ExternalLink(label: 'Website', url: 'https://saenzsoftware.com/'),
    ],
    featured: false,
  ),
  const Project(
    id: 'starfall',
    title: 'Starfall',
    category: ProjectCategory.artAndComics,
    platform: 'Web',
    dateRange: 'Ongoing',
    description:
        'An original fantasy graphic novel series illustrated in Procreate '
        'and laid out in Canva, serialized for readers on Tapas.',
    coverImageUrl: 'https://saenzsoftware.com/teamsupre.me/isaenz/img/starfall-cover.jpg',
    galleryImages: [
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/starfall-1.jpg',
      'https://saenzsoftware.com/teamsupre.me/isaenz/img/starfall-2.jpg',
    ],
    techStack: [
      TechStackItem(label: 'Procreate', group: 'Art'),
      TechStackItem(label: 'Canva', group: 'Art'),
      TechStackItem(label: 'Tapas.io', group: 'Publishing'),
    ],
    externalLinks: [
      ExternalLink(label: 'Read on Tapas', url: 'https://tapas.io/series/Starfall18/info'),
    ],
    featured: true,
  ),
];
