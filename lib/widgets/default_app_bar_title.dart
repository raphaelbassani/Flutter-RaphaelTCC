import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raphael_tcc/view_models/name_view_model.dart';

import 'default_button.dart';

class DefaultAppBarTitle extends StatefulWidget {
  const DefaultAppBarTitle({Key? key}) : super(key: key);

  @override
  _DefaultAppBarTitleState createState() => _DefaultAppBarTitleState();
}

class _DefaultAppBarTitleState extends State<DefaultAppBarTitle> {
  @override
  void initState() {
    super.initState();
    context.read<NameViewModel>().getCurrentName();
  }

  @override
  Widget build(BuildContext context) {
    NameViewModel nameViewModel = context.watch<NameViewModel>();

    String? currentName = nameViewModel.name;
    String message = "Olá ";
    if (currentName != null) {
      message = message + currentName;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
          DefaultButton(
            icon: Icons.refresh,
            onPressed: () async {
              await nameViewModel.getCurrentName();
            },
          ),
        ],
      ),
    );
  }
}
