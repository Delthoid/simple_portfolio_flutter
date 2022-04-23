import 'dart:convert';

import 'package:delthon_portfolio/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProjectsProvider with ChangeNotifier {
  final _projects = <Project>[
    Project(
      name: 'Flutter Weather ⛅',
      description:
          'A simple weather app made with flutter and integrated with weatherbit.io API.',
      downloadLink: 'downloadLink',
      repositoryLink: 'repositoryLink',
      previewLinks: [
        'https://raw.githubusercontent.com/Delthoid/Flutter-Weather-App/master/screenshots/homescreen_weather.png',
        'https://raw.githubusercontent.com/Delthoid/Flutter-Weather-App/master/screenshots/details_screen.png',
        'https://raw.githubusercontent.com/Delthoid/Flutter-Weather-App/master/screenshots/notification_menu.png',
      ],
      tags: [
        'Flutter',
        'Weatherbit.io',
        'API',
      ],
    ),
    Project(
      name: 'Quick Cab 🚕',
      description:
          'A Taxi booking application, designed by Omar Yassir on Figma. I converted the design into flutter app for practice purposes',
      downloadLink: 'downloadLink',
      repositoryLink: 'repositoryLink',
      previewLinks: [
        'https://raw.githubusercontent.com/Delthoid/quick_cab_with_map/master/screenshots/home.png',
        'https://raw.githubusercontent.com/Delthoid/quick_cab_with_map/master/screenshots/otw.png',
        'https://raw.githubusercontent.com/Delthoid/quick_cab_with_map/master/screenshots/profile.png',
      ],
      tags: [
        'Flutter',
        'Weatherbit.io',
        'API',
      ],
    ),
  ];

  List<Project> get projects {
    return _projects;
  }

  // Future<void> initializeJson() async {
  //   final String data =
  //       await rootBundle.loadString('assets/jsons/projects.json');
  //   final result = json.decode(data);

  //   result.forEach((project) {
  //     final projectItem = projectFromJson(project);
  //     print(project);
  //     //_projects.add(projectItem);
  //   });

  //   notifyListeners();
  // }
}
