import 'package:delthon_portfolio/models/project.dart';
import 'package:delthon_portfolio/provider/projects_data.dart';
import 'package:delthon_portfolio/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../theme/theme_index.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final projectsData = Provider.of<ProjectsProvider>(context);
    final projects = projectsData.projects;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: smallSpacing,
        ),
        Text(
          'Projects 💡',
          style: title.copyWith(
            color: accent,
            fontSize: 28,
          ),
        ),
        SizedBox(
          height: smallSpacing,
        ),
        Expanded(
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: projects.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var project = projects[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: ProjectCard(project: project),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
