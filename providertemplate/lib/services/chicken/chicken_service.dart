import 'package:providertemplate/business_logic/models/chicken.dart';

abstract class ChickenService {
  Future<List<Chicken>> getAllChickens();
}
