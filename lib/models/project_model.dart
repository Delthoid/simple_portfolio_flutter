class ProjectModel {
  final String name;
  final String description;
  final DateTime datePublished;
  final String downloadLink;
  final String repoLink;

  ProjectModel({
    required this.name,
    required this.description,
    required this.datePublished,
    required this.downloadLink,
    required this.repoLink,
  });
}
