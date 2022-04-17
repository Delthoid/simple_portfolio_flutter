import 'package:delthon_portfolio/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    this.color = accent,
  }) : super(key: key);

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? theme.primaryColor),
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(Size(100, 40)),
        maximumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
