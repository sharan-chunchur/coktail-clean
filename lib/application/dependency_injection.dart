import 'package:cocktail/domain/usecase/drink_details_usecase.dart';
import 'package:cocktail/presentation/drinks_details/drink_details_viewmodel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/datasource/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/drinks_usecase.dart';
import '../presentation/drinkslist/drinks_view_model.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  // instance
  //     .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(Connectivity()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  // // local data source
  // instance.registerLazySingleton<LocalDataSource>(
  //         () => LocalDataSourceImplementer());

  // repository
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance()));
}


initDrinkListModule(){
  if(!GetIt.I.isRegistered<DrinkUseCase>()){
    instance.registerFactory<DrinkUseCase>(() => DrinkUseCase(instance()));
    instance.registerFactory<DrinksViewModel>(() => DrinksViewModel(instance()));
  }
}

initDrinkDetailsModule(){
  if(!GetIt.I.isRegistered<DrinkDetailUseCase>()){
    instance.registerFactory<DrinkDetailUseCase>(() => DrinkDetailUseCase(instance()));
    instance.registerFactory<DrinkDetailsViewModel>(() => DrinkDetailsViewModel(instance()));
  }
}

