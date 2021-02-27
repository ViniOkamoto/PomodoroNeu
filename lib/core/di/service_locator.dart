import 'package:get_it/get_it.dart';
import 'package:pomodoroapp/app/data/datasource/local/theme_datasource.dart';
import 'package:pomodoroapp/app/data/repositories/theme_repository_impl.dart';
import 'package:pomodoroapp/app/domain/repositories/theme_repository.dart';
import 'package:pomodoroapp/app/domain/usecases/theme_usecase.dart';
import 'package:pomodoroapp/app/presentation/store/counter/counter_pomodoro_store.dart';
import 'package:pomodoroapp/app/presentation/store/theme/theme_store.dart';
import 'package:pomodoroapp/app/presentation/store/todo/todo_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // Datasource
  serviceLocator
      .registerLazySingleton<IThemeDatasource>(() => new ThemeDatasource());

  // Repos
  serviceLocator
      .registerLazySingleton<ThemeRepository>(() => new ThemeRepositoryImpl());

  // UseCases
  serviceLocator.registerFactory<ThemeUseCase>(() => new ThemeUseCase());

  // Stores
  serviceLocator.registerSingleton<ThemeStore>(ThemeStore());
  serviceLocator.registerLazySingleton<CounterPomodoroStore>(
      () => new CounterPomodoroStore());
  serviceLocator.registerLazySingleton<TodoStore>(() => new TodoStore());
}
