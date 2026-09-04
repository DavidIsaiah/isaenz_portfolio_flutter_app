import '../models/experience.dart';

/// Local seed mirroring the future GET /api/v1/experience response.
/// Used until the Spring Boot backend is live, and as an offline fallback.
final List<Experience> experienceSeed = [
  const Experience(
    id: 'micro1-manager2',
    role: 'Manager 2',
    company: 'Micro1',
    startDate: 'June 29, 2026',
    endDate: 'August 12, 2026',
    bullets: [
      'Led a team of technical experts delivering evaluation and training work for AI model development.',
      'Coordinated cross-functional scheduling and quality review processes.',
      'Mentored contributors on technical assessment standards.',
    ],
    displayOrder: 0,
  ),
  const Experience(
    id: 'micro1-gamedev-expert',
    role: 'Game Development Expert',
    company: 'Micro1',
    startDate: 'April 8, 2026',
    endDate: 'June 28, 2026',
    bullets: [
      'Evaluated and annotated game-development code samples to train AI coding models.',
      'Authored technical rubrics covering engine architecture, physics, and rendering correctness.',
      'Reviewed submissions from other domain experts for accuracy and consistency.',
    ],
    displayOrder: 1,
  ),
  const Experience(
    id: 'msp-fullstack',
    role: 'Full Stack Developer',
    company: 'Morning Star Press',
    companyUrl: 'https://saenzsoftware.com/',
    startDate: 'January 2026',
    endDate: 'March 2026',
    bullets: [
      'Built a Spring Boot + PostgreSQL backend to power a publishing platform.',
      'Automated editorial and email workflows with n8n and SendGrid.',
      'Containerized the full stack with Docker for repeatable deployment.',
    ],
    displayOrder: 2,
  ),
  const Experience(
    id: 'ainutrix-flutter-php',
    role: 'Flutter Developer & PHP Developer',
    company: 'AI Nutrix',
    startDate: 'July 8, 2020',
    endDate: 'December 23, 2025',
    bullets: [
      'Developed the AINutrix Flutter/Dart mobile client end to end.',
      'Built and maintained a Yii PHP + MySQL backend serving the app.',
      'Integrated Firebase authentication and the Nutritionix API for food data.',
    ],
    displayOrder: 3,
  ),
  const Experience(
    id: '3advance-intern',
    role: 'Software Development Intern',
    company: '3Advance',
    startDate: 'January 15, 2020',
    endDate: 'April 1, 2020',
    bullets: [
      'Contributed to internal tooling and application development under senior engineer guidance.',
      'Gained production experience with team code review and version control workflows.',
    ],
    displayOrder: 4,
  ),
  const Experience(
    id: 'thumbthrasher-dev',
    role: 'Game Developer & Artist',
    company: 'ThumbThrasher',
    startDate: 'March 1, 2017',
    endDate: 'November 5, 2019',
    bullets: [
      'Designed and shipped a libGDX/Box2D arcade game to iOS and Android.',
      'Implemented Bluetooth controller support via Core Bluetooth and RoboVM.',
      'Handled game art and animation alongside core engine programming.',
    ],
    displayOrder: 5,
  ),
  const Experience(
    id: 'superquetzal-dev',
    role: 'Game Developer & Artist',
    company: 'SuperQuetzal',
    startDate: 'April 5, 2015',
    endDate: 'February 2, 2017',
    bullets: [
      'Built a 2D platformer in libGDX with Box2D physics.',
      'Modeled and animated 3D assets in Blender for 2D sprite pipelines.',
      'Produced supporting 2D animation in Adobe Animate.',
    ],
    displayOrder: 6,
  ),
];
