class Category {
  final String categoryTitle;
  final String categoryLink;
  final String iconLink;
  final String oldDate;
  final String newDate;
  final String updated;

  Category(
      {required this.categoryTitle,
      required this.categoryLink,
      required this.iconLink,
      required this.oldDate,
      required this.newDate,
      required this.updated});
}

class SiteCategories {
  final String name;
  final String url;
  final String logoUrl;

  SiteCategories({
    required this.name,
    required this.url,
    required this.logoUrl,
  });
}
