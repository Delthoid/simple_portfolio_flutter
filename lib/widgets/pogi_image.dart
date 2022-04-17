import 'package:delthon_portfolio/theme/colors.dart';
import 'package:delthon_portfolio/theme/sizing.dart';
import 'package:delthon_portfolio/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PogiImage extends StatefulWidget {
  const PogiImage({Key? key}) : super(key: key);

  @override
  State<PogiImage> createState() => _PogiImageState();
}

class _PogiImageState extends State<PogiImage> {
  var offset = Offset.zero;

  Widget pogi() {
    return MouseRegion(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 200,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
        ),
        child: Image.asset(
          'assets/pogi.jpg',
          fit: BoxFit.fitHeight,
          alignment: offset == Offset.zero
              ? Alignment.center
              : Alignment(offset.dx, offset.dy),
          scale: offset == Offset.zero ? 1 : 2.5,
        ),
      ),
      onHover: (test) {
        setState(() {
          offset = Offset(test.delta.dx / 100, test.delta.dy / 100);
        });
        print('Delta: ${test.delta}');
        print('Offset: $offset');
      },
      onExit: (xx) {
        setState(() {
          offset = Offset.zero;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 28,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'About me 👦🏽',
                style: title.copyWith(
                  color: accent,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: smallSpacing,
              ),
              const Text("Hi, I'm"),
              Text(
                'Delthon Villanueva',
                style: title.copyWith(
                  fontSize: 32,
                  color: accent,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              const Text("I'm currently working as Flutter Developer."),
            ],
          ),
          pogi(),
        ],
      ),
    );
  }
}
