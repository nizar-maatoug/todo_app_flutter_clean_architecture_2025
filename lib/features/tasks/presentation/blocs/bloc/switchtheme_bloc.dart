import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switchtheme_event.dart';
part 'switchtheme_state.dart';

class SwitchthemeBloc
    extends Bloc<SwitchthemeEvent, SwitchthemeState> {
  SwitchthemeBloc()
    : super(const SwitchthemeInitial(themeValue: true)) {
    on<SwitchthemeEvent>((event, emit) {
      if (event is SwitchLightThemeEvent) {
        emit(const SwitchthemeState(themeValue: true));
      } else {
        emit(const SwitchthemeState(themeValue: false));
      }
    });
  }

  @override
  Stream<SwitchthemeState> mapEventToState(
    SwitchthemeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
