import 'package:flutter/material.dart';
import 'package:raphael_tcc/controllers/constants.dart';

class DefaultButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double? size;

  const DefaultButton({Key? key, required this.icon, this.onPressed, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Icon(
        icon,
        size: size ?? Constants.iconSize,
        color: Constants.textColor,
      ),
      onPressed: onPressed,
    );
  }
}
