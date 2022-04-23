import 'package:animations/animations.dart';
import 'package:delthon_portfolio/models/project.dart';
import 'package:delthon_portfolio/provider/projects_data.dart';
import 'package:delthon_portfolio/theme/colors.dart';
import 'package:delthon_portfolio/theme/theme_index.dart';
import 'package:delthon_portfolio/widgets/widget_index.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isSelected = false;

  final previewWidth = 150.0;
  final startPadding = 23.0;
  final dura = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutQuart;
  var previewImageHeight = 250.0;

  bool showDetails = false;

  @override
  void dispose() {
    isSelected = false;
    super.dispose();
  }

  Widget appPreview() {
    return Stack(
      alignment: Alignment.bottomCenter,
      //alignment: WrapAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50, top: 0),
          child: Container(
            width: 180,
            height: 150,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/sc2.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Container(
            width: 180,
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/sc1.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget mainContent(double? height) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //height: 200,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Row(
                children: [
                  const Spacer(),
                  appPreview(),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.name,
                      style: title.copyWith(fontSize: 22),
                    ),
                    Text(widget.project.description),
                    const SizedBox(
                      height: 23,
                    ),
                    Wrap(
                      spacing: 10,
                      children: const [
                        CustomButton(
                          label: 'Download',
                        ),
                        CustomButton(
                          label: 'Source code',
                          color: accent2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget previewContainer(
    Color color,
    String image,
  ) {
    return Container(
      height: previewImageHeight,
      //width: 150,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: color,
      ),
      child: Image.network(
        image,
        fit: BoxFit.fitWidth,
        height: previewImageHeight,
        alignment: Alignment.topCenter,
      ),
    );
  }

  Widget hiddenRow() {
    return Padding(
      padding: EdgeInsets.only(right: startPadding),
      child: Row(
        children: [
          previewContainer(Colors.red, 'assets/sc1.png'),
        ],
      ),
    );
  }

  Widget buildProjectDescription(Project project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'APP DESCRIPTION',
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.bold,
          ),
        ),
        SelectableText(project.description),
        SizedBox(
          height: 13,
        ),
        const Text(
          'TAGS',
          style: TextStyle(
            color: accent,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          children: [
            ...widget.project.tags.map((e) => Text('$e ')),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isSelected = !isSelected;
        if (showDetails)
          setState(() {
            showDetails = false;
          });
      }),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // AnimatedSize(
            //   duration: dura,
            //   curve: curve,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 23),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           boxShadow: isSelected
            //               ? [
            //                   const BoxShadow(
            //                     color: accent,
            //                     spreadRadius: -13,
            //                     blurRadius: 33,
            //                     offset:
            //                         Offset(0, 20), // changes position of shadow
            //                   ),
            //                 ]
            //               : null),
            //     ),
            //   ),
            // ),
            AnimatedSize(
              duration: dura,
              curve: curve,
              child: Padding(
                padding: const EdgeInsets.only(top: 23),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: secondary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSwitcher(
                        duration: dura,
                        switchInCurve: curve,
                        switchOutCurve: curve,
                        reverseDuration: const Duration(microseconds: 100),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 23, left: 23),
                              child: Text(
                                widget.project.name,
                                style: title.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,

                                  // fontWeight: isSelected
                                  //     ? FontWeight.bold
                                  //     : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: dura,
                        curve: curve,
                        height: isSelected ? previewImageHeight : 0,
                        onEnd: () => setState(() {
                          if (isSelected) {
                            showDetails = !showDetails;
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 23, bottom: 23, top: 23),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedSize(
                              duration: Duration(milliseconds: 300),
                              curve: curve,
                              child: showDetails
                                  ? buildProjectDescription(widget.project)
                                  : Text(
                                      widget.project.description,
                                      maxLines: 1,
                                    ),
                            ),
                            // AnimatedSwitcher(
                            //   duration: dura,
                            //   reverseDuration: dura,
                            //   switchInCurve: curve,
                            //   switchOutCurve: curve,
                            //   child: isSelected
                            //       ? Container(
                            //           // child: Text(
                            //           //   widget.project.description,
                            //           // ),
                            //           child:
                            //               buildProjectDescription(widget.project),
                            //         )
                            //       : Text(
                            //           widget.project.description,
                            //           maxLines: 1,
                            //         ),
                            // ),
                            // Text(
                            //   widget.project.description,
                            //   maxLines: isSelected ? null : 1,
                            // ),
                            const SizedBox(
                              height: 12,
                            ),
                            Wrap(
                              spacing: 10,
                              children: [
                                CustomButton(
                                  label: 'Download',
                                  onPressed: () {
                                    // context
                                    //     .read<ProjectsProvider>()
                                    //     .initializeJson();
                                  },
                                ),
                                CustomButton(
                                  label: 'Source code',
                                  color: accent2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositionedDirectional(
              start: isSelected
                  ? ((previewWidth * 2) + (startPadding - 46))
                  : constraints.maxWidth - 280,
              top: isSelected ? 85 : 43,
              curve: curve,
              child: previewContainer(
                  Colors.yellow, widget.project.previewLinks.last),
              duration: dura,
            ),
            AnimatedPositionedDirectional(
              start: isSelected
                  ? (previewWidth + (startPadding - 23))
                  : constraints.maxWidth - 230,
              top: isSelected ? 85 : 30,
              curve: curve,
              child:
                  previewContainer(Colors.blue, widget.project.previewLinks[1]),
              duration: dura,
            ),
            AnimatedPositionedDirectional(
              start: isSelected ? startPadding : constraints.maxWidth - 180,
              top: isSelected ? 85 : 0,
              curve: curve,
              child: previewContainer(
                  Colors.red, widget.project.previewLinks.first),
              duration: dura,
            ),
            // AnimatedContainer(
            //   height: isSelected ? 300 : 150,
            //   curve: curve,
            //   duration: dura,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //     color: secondary,
            //   ),
            // ),
            // AnimatedPositionedDirectional(
            //   start: isSelected
            //       ? ((previewWidth * 2) + (startPadding * 3))
            //       : constraints.maxWidth - 280,
            //   top: isSelected ? 62 : 43,
            //   curve: curve,
            //   child: previewContainer(Colors.yellow, 'assets/sc1.png'),
            //   duration: dura,
            // ),
            // AnimatedPositionedDirectional(
            //   start: isSelected
            //       ? (previewWidth + (startPadding * 2))
            //       : constraints.maxWidth - 230,
            //   top: isSelected ? 62 : 30,
            //   curve: curve,
            //   child: previewContainer(Colors.blue, 'assets/sc2.png'),
            //   duration: dura,
            // ),
            // AnimatedPositionedDirectional(
            //   start: isSelected ? startPadding : constraints.maxWidth - 180,
            //   top: isSelected ? 62 : 0,
            //   curve: curve,
            //   child: previewContainer(Colors.red, 'assets/sc1.png'),
            //   duration: dura,
            // ),
            // AnimatedPositioned(
            //   top: isSelected ? 23 : 50,
            //   left: isSelected ? 23 : 23,
            //   curve: curve,
            //   duration: dura,
            // child: Text(
            //   widget.project.name,
            //   style: title.copyWith(fontSize: 22),
            // ),
            // ),
            // SizedBox(
            //   height: 170,
            //   width: double.infinity,
            //   child: Padding(
            //     padding: const EdgeInsets.all(23),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const SizedBox(
            //           height: 22,
            //         ),
            //         Text(widget.project.description),
            //         const SizedBox(
            //           height: 12,
            //         ),
            //         Wrap(
            //           spacing: 10,
            //           children: const [
            //             CustomButton(
            //               label: 'Download',
            //             ),
            //             CustomButton(
            //               label: 'Source code',
            //               color: accent2,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}
