part of 'switchtheme_bloc.dart';

class SwitchthemeState extends Equatable {
  final bool themeValue;

  const SwitchthemeState({required this.themeValue});

  @override
  List<Object> get props => [themeValue];
}

class SwitchthemeInitial extends SwitchthemeState {
  const SwitchthemeInitial({required super.themeValue});
}
