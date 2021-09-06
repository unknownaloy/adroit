import 'package:adroit/models/wallpaper.dart';
import 'package:equatable/equatable.dart';

abstract class HomeStates extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class HomeLoadedState extends HomeStates {
  late final List<Wallpaper> wallpapers;

  HomeLoadedState(wallpaper);

  @override
  List<Object> get props => [wallpapers];
}
