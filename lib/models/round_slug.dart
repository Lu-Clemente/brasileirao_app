class RoundSlug {
  final String slug;

  RoundSlug({required this.slug});

  factory RoundSlug.fromJson(Map<String, dynamic> json) {
    return RoundSlug(
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
    };
  }
}
