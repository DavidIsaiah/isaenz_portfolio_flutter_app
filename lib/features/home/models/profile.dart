class ContactLink {
  final String label;
  final String url;
  final String type; // email | linkedin | website | tapas

  const ContactLink({required this.label, required this.url, required this.type});

  factory ContactLink.fromJson(Map<String, dynamic> json) => ContactLink(
        label: json['label'] as String,
        url: json['url'] as String,
        type: json['type'] as String,
      );

  Map<String, dynamic> toJson() => {'label': label, 'url': url, 'type': type};
}

class Profile {
  final String name;
  final String tagline;
  final String bio;
  final String photoUrl;
  final String location;
  final bool usCitizen;
  final List<String> skillChips;
  final List<ContactLink> contactLinks;

  const Profile({
    required this.name,
    required this.tagline,
    required this.bio,
    required this.photoUrl,
    required this.location,
    required this.usCitizen,
    required this.skillChips,
    required this.contactLinks,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json['name'] as String,
        tagline: json['tagline'] as String,
        bio: json['bio'] as String,
        photoUrl: json['photoUrl'] as String,
        location: json['location'] as String,
        usCitizen: json['usCitizen'] as bool? ?? true,
        skillChips: (json['skillChips'] as List).cast<String>(),
        contactLinks: (json['contactLinks'] as List)
            .map((e) => ContactLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagline': tagline,
        'bio': bio,
        'photoUrl': photoUrl,
        'location': location,
        'usCitizen': usCitizen,
        'skillChips': skillChips,
        'contactLinks': contactLinks.map((e) => e.toJson()).toList(),
      };
}
