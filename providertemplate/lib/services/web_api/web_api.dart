import 'package:providertemplate/business_logic/models/chicken.dart';

abstract class WebApi {
  Future<List<Chicken>> fetchChickens();
}
