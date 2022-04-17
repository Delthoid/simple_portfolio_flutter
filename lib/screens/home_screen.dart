import 'package:delthon_portfolio/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_index.dart';
import '../widgets/widget_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 2) - 90;
    return Scaffold(
      backgroundColor: background,
      body: Consumer<MainProvider>(builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 90,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   state.title,
                  //   style: title,
                  // ),
                  // const SizedBox(
                  //   height: smallSpacing,
                  // ),
                  const BuildCardNavigation(),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: width,
                child: const RightPanel(),
              ),
              const Spacer(),
            ],
          ),
        );
      }),
    );
  }
}
