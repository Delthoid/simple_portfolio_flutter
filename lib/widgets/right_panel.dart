import 'package:delthon_portfolio/provider/main_provider.dart';
import 'package:delthon_portfolio/widgets/pogi_image.dart';
import 'package:delthon_portfolio/widgets/widget_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    //Wdigets
    Widget pogi = const PogiImage();
    Widget projects = const Projects();

    return Consumer<MainProvider>(
      builder: (context, state, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.selectedNavId == 2 ? pogi : projects,
          transitionBuilder: (child, Animation<double> animation) =>
              FadeTransition(
            child: child,
            opacity: animation,
            // scale: animation,
            // alignment: Alignment.bottomCenter,
          ),
        );

        //AnimatedSwitcher.defaultTransitionBuilder(child, animation)
      },
    );
  }
}
