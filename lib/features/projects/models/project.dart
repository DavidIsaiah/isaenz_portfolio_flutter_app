enum ProjectCategory { mobileApps, games, artAndComics, web }

extension ProjectCategoryX on ProjectCategory {
  static ProjectCategory fromApi(String value) {
    switch (value) {
      case 'MOBILE_APPS':
        return ProjectCategory.mobileApps;
      case 'GAMES':
        return ProjectCategory.games;
      case 'ART_AND_COMICS':
        return ProjectCategory.artAndComics;
      case 'WEB':
        return ProjectCategory.web;
      default:
        throw ArgumentError('Unknown category: $value');
    }
  }

  String get apiValue {
    switch (this) {
      case ProjectCategory.mobileApps:
        return 'MOBILE_APPS';
      case ProjectCategory.games:
        return 'GAMES';
      case ProjectCategory.artAndComics:
        return 'ART_AND_COMICS';
      case ProjectCategory.web:
        return 'WEB';
    }
  }

  String get label {
    switch (this) {
      case ProjectCategory.mobileApps:
        return 'Mobile Apps';
      case ProjectCategory.games:
        return 'Games';
      case ProjectCategory.artAndComics:
        return 'Art & Comics';
      case ProjectCategory.web:
        return 'Web';
    }
  }
}

class TechStackItem {
  final String label;
  final String group; // e.g. Engine & Code, Art, Audio

  const TechStackItem({required this.label, required this.group});

  factory TechStackItem.fromJson(Map<String, dynamic> json) => TechStackItem(
        label: json['label'] as String,
        group: json['group'] as String,
      );

  Map<String, dynamic> toJson() => {'label': label, 'group': group};
}

class ExternalLink {
  final String label;
  final String url;

  const ExternalLink({required this.label, required this.url});

  factory ExternalLink.fromJson(Map<String, dynamic> json) => ExternalLink(
        label: json['label'] as String,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {'label': label, 'url': url};
}

class Project {
  final String id;
  final String title;
  final ProjectCategory category;
  final String platform;
  final String dateRange;
  final String description;
  final String coverImageUrl;
  final List<String> galleryImages;
  final List<TechStackItem> techStack;
  final List<ExternalLink> externalLinks;
  final bool featured;

  const Project({
    required this.id,
    required this.title,
    required this.category,
    required this.platform,
    required this.dateRange,
    required this.description,
    required this.coverImageUrl,
    required this.galleryImages,
    required this.techStack,
    required this.externalLinks,
    required this.featured,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'] as String,
        title: json['title'] as String,
        category: ProjectCategoryX.fromApi(json['category'] as String),
        platform: json['platform'] as String,
        dateRange: json['dateRange'] as String,
        description: json['description'] as String,
        coverImageUrl: json['coverImageUrl'] as String,
        galleryImages: (json['galleryImages'] as List).cast<String>(),
        techStack: (json['techStack'] as List)
            .map((e) => TechStackItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        externalLinks: (json['externalLinks'] as List)
            .map((e) => ExternalLink.fromJson(e as Map<String, dynamic>))
            .toList(),
        featured: json['featured'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category.apiValue,
        'platform': platform,
        'dateRange': dateRange,
        'description': description,
        'coverImageUrl': coverImageUrl,
        'galleryImages': galleryImages,
        'techStack': techStack.map((e) => e.toJson()).toList(),
        'externalLinks': externalLinks.map((e) => e.toJson()).toList(),
        'featured': featured,
      };
}
