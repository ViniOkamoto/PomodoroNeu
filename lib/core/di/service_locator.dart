

import 'package:get_it/get_it.dart';
import 'package:pomodoroapp/app/data/datasource/local/theme_datasource.dart';
import 'package:pomodoroapp/app/data/repositories/theme_repository_impl.dart';
import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/app/domain/usecases/theme_usecase.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // Datasource
  serviceLocator.registerLazySingleton<IThemeDatasource>(() => new ThemeDatasource());

  // Repos
  serviceLocator
      .registerLazySingleton<ThemeRepository>(() => new ThemeRepositoryImpl());

  // UseCases
  serviceLocator.registerFactory<ThemeUseCase>(() => new ThemeUseCase());

  // ViewModels
  serviceLocator
      .registerLazySingleton<ThemeStore>(() => new ThemeStore());
}