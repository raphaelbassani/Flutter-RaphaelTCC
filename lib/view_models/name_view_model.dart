import 'package:flutter/cupertino.dart';
import 'package:raphael_tcc/controllers/helpers.dart';

class NameViewModel extends ChangeNotifier {
  String? name;

  Future<void> getCurrentName() async {
    var result = await NameHelper.getName();
    if (result != null) {
      name = result.results?.first?.name?.first;
    }
    notifyListeners();
  }
}
