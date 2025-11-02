part of 'switchtheme_bloc.dart';

abstract class SwitchthemeEvent extends Equatable {
  const SwitchthemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchLightThemeEvent extends SwitchthemeEvent{

}

class SwitchDarkThemeEvent extends SwitchthemeEvent{
  
}
