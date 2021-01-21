import 'package:providertemplate/business_logic/models/chicken.dart';
import 'package:providertemplate/services/service.locator.dart';
//import 'package:providertemplate/services/storage/storage_service.dart';
import 'package:providertemplate/services/web_api/web_api.dart';

import 'chicken_service.dart';

class ChickenServiceImpl implements ChickenService {
  WebApi _webApi = serviceLocator<WebApi>();
  //StorageService _storageService = serviceLocator<StorageService>();

  @override
  Future<List<Chicken>> getAllChickens() async {
    List<Chicken> webData = await _webApi.fetchChickens();

    return webData;
  }
}
