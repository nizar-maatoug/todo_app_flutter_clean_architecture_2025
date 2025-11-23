import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:todo_app/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_app/features/auth/presentation/screens/profile_screen.dart';
import 'package:todo_app/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/detail_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/edit_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:todo_app/features/tasks/presentation/widgets/toolbar_action_theme_widget.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter({required this.authBloc});

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home,
    refreshListenable: GoRouterRefreshNotifier(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final currentLocation = state.matchedLocation;

      final loggingIn =
          currentLocation == '/login' ||
          currentLocation == '/register';

      if (authState is UnAuthenticatedState && !loggingIn) {
        return '/login';
      }

      if (authState is AuthenticatedState && loggingIn) {
        return '/tasks';
      }

      return null;
    },
    routes: [
      //Shell for main application layout
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('TODO APP'),
              actions: [
                const ActionThemeButton(),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(
                      context,
                    ).add(LogoutEvent());
                    //Navigate.......
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _calculateIndex(
                state.matchedLocation,
              ),
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go(AppRoutes.home);
                    break;
                  case 1:
                    context.go(AppRoutes.profile);
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            builder: (context, state) {
              return const TasksScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.addTask,
            name: 'add_task',
            builder: (context, state) {
              return const AddTaskScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.detailTask,
            name: 'detail_task',
            builder: (context, state) {
              return const DetailTaskScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.editTask,
            name: 'edit_task',
            builder: (context, state) {
              return const EditTaskScreen();
            },
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            builder: (context, state) {
              return const ProfileScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
    ],
  );
}

int _calculateIndex(String location) {
  if (location.startsWith('/tasks')) return 0;
  if (location.startsWith('/profile')) return 1;
  return 0;
}

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(Stream stream) {
    stream.listen((_) => notifyListeners());
  }
}
