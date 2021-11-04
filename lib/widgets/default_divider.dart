import 'package:flutter/material.dart';
import 'package:raphael_tcc/controllers/constants.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Divider(
        color: Constants.textColor,
      ),
    );
  }
}
