import 'package:adroit/models/wallpaper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeStates extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class HomeLoadedState extends HomeStates {
  final List<Wallpaper> wallpapers;

   HomeLoadedState(this.wallpapers);

  @override
  List<Object> get props => [wallpapers];
}
