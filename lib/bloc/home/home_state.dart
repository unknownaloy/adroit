import 'package:adroit/models/wallpaper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  const HomeErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class HomeSuccessState extends HomeState {
  final List<Wallpaper> wallpapers;

  const HomeSuccessState({required this.wallpapers});

  HomeSuccessState copyWith(List<Wallpaper>? wallpapers) {
    return HomeSuccessState(wallpapers: wallpapers ?? this.wallpapers);
  }

  @override
  List<Object> get props => [wallpapers];
}
