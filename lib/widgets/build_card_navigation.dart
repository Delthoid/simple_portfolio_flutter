import 'package:delthon_portfolio/provider/main_provider.dart';
import 'package:delthon_portfolio/theme/theme_index.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildCardNavigation extends StatefulWidget {
  const BuildCardNavigation({Key? key}) : super(key: key);

  @override
  State<BuildCardNavigation> createState() => BuildCardNavigationState();
}

class BuildCardNavigationState extends State<BuildCardNavigation> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<MainProvider>(context);
    var selectedId = appProvider.selectedNavId;

    return Row(
      children: [
        Column(
          children: [
            CardNavigation(
              navId: 0,
              title: 'Projects',
              child: Center(
                child: Icon(
                  EvaIcons.bulbOutline,
                  size: 50,
                  color: selectedId == 0 ? Colors.white : accent,
                ),
              ),
            ),
            SizedBox(
              height: smallSpacing,
            ),
            CardNavigation(
              navId: 1,
              title: 'Skills',
              child: Center(
                child: Icon(
                  EvaIcons.code,
                  size: 50,
                  color: selectedId == 1 ? Colors.white : accent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: smallSpacing,
        ),
        Column(
          children: [
            CardNavigation(
              malaki: false,
              navId: 2,
              title: 'About',
              child: Center(
                child: Icon(
                  EvaIcons.personAddOutline,
                  size: 30,
                  color: selectedId == 2 ? Colors.white : accent,
                ),
              ),
            ),
            SizedBox(
              height: smallSpacing,
            ),
            CardNavigation(
              malaki: false,
              navId: 3,
              title: 'Contact',
              child: Center(
                child: Icon(
                  EvaIcons.phoneCallOutline,
                  size: 30,
                  color: selectedId == 3 ? Colors.white : accent,
                ),
              ),
            ),
            SizedBox(
              height: smallSpacing,
            ),
            CardNavigation(
              malaki: false,
              navId: 4,
              title: 'Links',
              child: Center(
                child: Icon(
                  EvaIcons.link2Outline,
                  size: 30,
                  color: selectedId == 4 ? Colors.white : accent,
                ),
              ),
            ),
            SizedBox(
              height: smallSpacing,
            ),
          ],
        ),
      ],
    );
  }
}

class CardNavigation extends StatefulWidget {
  const CardNavigation({
    Key? key,
    this.malaki = true,
    required this.title,
    required this.navId,
    required this.child,
  }) : super(key: key);

  final String title;
  final bool malaki;
  final int navId;
  final Widget child;

  @override
  State<CardNavigation> createState() => CardNavigationState();
}

class CardNavigationState extends State<CardNavigation> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<MainProvider>(context);
    return GestureDetector(
      onTap: () {
        appProvider.setSelectedNavId(widget.navId);
        appProvider.setTitle(widget.title);
      },
      child: Container(
        width: widget.malaki ? bigCardNavigation : smallCardNavigation,
        height: widget.malaki ? bigCardNavigation : smallCardNavigation,
        decoration: BoxDecoration(
            color:
                widget.navId == appProvider.selectedNavId ? accent : secondary,
            borderRadius: BorderRadius.circular(widget.malaki ? 30 : 20),
            boxShadow: widget.navId == appProvider.selectedNavId
                ? [
                    const BoxShadow(
                      color: accent,
                      spreadRadius: -13,
                      blurRadius: 33,
                      offset: Offset(0, 20), // changes position of shadow
                    ),
                  ]
                : null),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: smallerTitle.copyWith(
                  color: widget.navId == appProvider.selectedNavId
                      ? Colors.white
                      : textColor,
                  fontWeight: widget.navId == appProvider.selectedNavId
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            //Spacer(),
            widget.child,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
