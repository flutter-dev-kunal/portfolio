class Project {
  final String title;
  final String description;
  final String? playStoreLink;
  final String? appStoreLink;

  Project({
    required this.title,
    required this.description,
    this.playStoreLink,
    this.appStoreLink
  });
}