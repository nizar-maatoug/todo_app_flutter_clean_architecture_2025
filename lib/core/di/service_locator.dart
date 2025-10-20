import 'package:get_it/get_it.dart';
import 'package:todo_app/core/router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // find and instanciate AppRouter
  sl.registerLazySingleton(() => AppRouter());
}
