import 'package:get_it/get_it.dart';
import 'package:todo_app/core/router/app_router.dart';
import 'package:todo_app/features/tasks/presentation/blocs/bloc/switchtheme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // find and instanciate AppRouter
  sl.registerLazySingleton(() => AppRouter());

  // find and instanciate SwitchthemeBloc
  sl.registerLazySingleton(() => SwitchthemeBloc());
}
