import 'package:go_router/go_router.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_app/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/detail_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/edit_task_screen.dart';
import 'package:todo_app/features/tasks/presentation/screens/tasks_screen.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home,
    routes: <GoRoute>[
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
