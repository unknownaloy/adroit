import 'package:adroit/models/wallpaper.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeFetchEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  late final List<Wallpaper> wallpaper;

  HomeLoadedEvent(Wallpaper wallpaper);

  @override
  List<Object> get props => [wallpaper];
}

class HomeNextData extends HomeEvent {}
