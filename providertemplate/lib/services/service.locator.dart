import 'package:get_it/get_it.dart';
import 'package:providertemplate/business_logic/view_models/chicken_screen_viewmodel.dart';
import 'package:providertemplate/services/chicken/chicken_service.dart';
import 'package:providertemplate/services/chicken/chicken_service_impl.dart';
import 'package:providertemplate/services/storage/storage_service.dart';
import 'package:providertemplate/services/storage/storage_service_impl.dart';
import 'package:providertemplate/services/web_api/web_api.dart';
//import 'package:providertemplate/services/web_api/web_api_dummy.dart';
import 'package:providertemplate/services/web_api/web_api_sql.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiSql());
  serviceLocator
      .registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator
      .registerLazySingleton<ChickenService>(() => ChickenServiceImpl());

  serviceLocator
      .registerFactory<ChickenScreenViewModel>(() => ChickenScreenViewModel());
}
