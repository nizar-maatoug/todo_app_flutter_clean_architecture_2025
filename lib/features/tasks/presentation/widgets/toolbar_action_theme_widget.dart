import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/tasks/presentation/blocs/bloc/switchtheme_bloc.dart';


class ActionThemeButton extends StatelessWidget {
  const ActionThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchthemeBloc, SwitchthemeState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                state.themeValue
                    ? BlocProvider.of<SwitchthemeBloc>(context)
                        .add(SwitchDarkThemeEvent())
                    : BlocProvider.of<SwitchthemeBloc>(context)
                        .add(SwitchLightThemeEvent());
              },
              child: state.themeValue
                  ? const Icon(
                      Icons.dark_mode,
                      size: 26.0,
                    )
                  : const Icon(
                      Icons.light_mode,
                      size: 26.0,
                    ),
            ));
      },
    );
  }
}
