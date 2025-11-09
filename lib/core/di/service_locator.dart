import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/core/firebase/auth_service.dart';
import 'package:todo_app/core/router/app_router.dart';
import 'package:todo_app/features/tasks/presentation/blocs/bloc/switchtheme_bloc.dart';
import 'package:todo_app/firebase_options.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Firebase first
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register Auth service
  sl.registerLazySingleton<AuthService>(
    () => AuthService(FirebaseAuth.instance),
  );

  // find and instanciate AppRouter
  sl.registerLazySingleton(() => AppRouter());

  // find and instanciate SwitchthemeBloc
  sl.registerLazySingleton(() => SwitchthemeBloc());
}
