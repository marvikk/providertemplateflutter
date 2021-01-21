import 'package:providertemplate/business_logic/models/chicken.dart';
import 'package:providertemplate/services/web_api/web_api.dart';

class WebApiDummy implements WebApi {
  Future<List<Chicken>> fetchChickens() async {
    List<Chicken> list = [];
    list.add(Chicken(name: "Sandy", age: 1));
    list.add(Chicken(name: "Candy", age: 2));
    list.add(Chicken(name: "Mandy", age: 3));

    return list;
  }
}
