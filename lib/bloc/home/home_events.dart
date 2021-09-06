import 'package:adroit/models/wallpaper.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeFetchEvent extends HomeEvents {}

class HomeLoadedEvent extends HomeEvents {
  late final List<Wallpaper> wallpaper;

  HomeLoadedEvent(Wallpaper wallpaper);

  @override
  List<Object> get props => [wallpaper];
}
