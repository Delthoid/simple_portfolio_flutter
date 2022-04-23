import 'package:meta/meta.dart';
import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
    Project({
        required this.name,
        required this.description,
        required this.downloadLink,
        required this.repositoryLink,
        required this.previewLinks,
        required this.tags,
    });

    final String name;
    final String description;
    final String downloadLink;
    final String repositoryLink;
    final List<String> previewLinks;
    final List<String> tags;

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        description: json["description"],
        downloadLink: json["downloadLink"],
        repositoryLink: json["repositoryLink"],
        previewLinks: List<String>.from(json["previewLinks"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "downloadLink": downloadLink,
        "repositoryLink": repositoryLink,
        "previewLinks": List<dynamic>.from(previewLinks.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}
