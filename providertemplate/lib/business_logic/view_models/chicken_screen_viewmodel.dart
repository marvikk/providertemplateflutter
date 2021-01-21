import 'package:flutter/cupertino.dart';
import 'package:providertemplate/business_logic/models/chicken.dart';
import 'package:providertemplate/services/chicken/chicken_service.dart';
import 'package:providertemplate/services/service.locator.dart';

class ChickenScreenViewModel extends ChangeNotifier {
  final ChickenService _chickenService = serviceLocator<ChickenService>();

  List<ChickenPresentation> _allChicks = [];
  List<ChickenPresentation> get allChicks {
    return _allChicks;
  }

  void loadData() async {
    await _loadChicks();
    notifyListeners();
  }

  Future<void> _loadChicks() async {
    final chicks = await _chickenService.getAllChickens();
    _allChicks = _loadAllChicks(chicks);
  }

  List<ChickenPresentation> _loadAllChicks(List<Chicken> chicks) {
    List<ChickenPresentation> res = [];

    chicks.forEach((chick) {
      String age = chick.age.toString();
      res.add(ChickenPresentation(name: chick.name, age: age));
    });

    return res;
  }

  Future refreshChicks() async {
    await _loadChicks();
    notifyListeners();
  }
}

class ChickenPresentation {
  String name;
  String age;

  ChickenPresentation({this.name, this.age});
}
