import 'package:adroit/bloc/home/home_event.dart';
import 'package:adroit/bloc/home/home_state.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:adroit/services/failure.dart';
import 'package:adroit/services/wallpaper_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WallpaperService _wallpaperService;

  HomeBloc({required WallpaperService wallpaperService})
      : _wallpaperService = wallpaperService,
        super(HomeInitialState());

  int _currentPage = 1;

  // List<Wallpaper> _listOfWallpapers = [];

  // @override
  // HomeStates? fromJson(Map<String, dynamic> json) {
  //   // TODO: implement fromJson
  //   print("Error from fromJson in the HomeBloc");
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(HomeStates state) {
  //   // TODO: implement toJson
  //   if (state is HomeLoadedState) {
  //     for (final wallpaper in state.wallpapers) {
  //       return wallpaper.toJson();
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeFetchEvent) {
      yield* _mapHomeFetchEventToState(event);
    } else if (event is HomeNextData) {
      // Handle next data event
      yield* _mapHomeEventToState(event);
    }
  }

  Stream<HomeState> _mapHomeFetchEventToState(HomeFetchEvent event) async* {
    // yield HomeLoadingState();

    try {
      List<Wallpaper> tempWallpaperCache =
          await _wallpaperService.getListOfPhotos();

      // _listOfWallpapers = tempWallpaperCache;

      yield HomeLoadedState(wallpapers: tempWallpaperCache);
    } on Failure catch (e) {
      // Do something with error
      yield HomeErrorState(e.message);
    }
  }

  Stream<HomeState> _mapHomeEventToState(HomeNextData event) async* {
    // Handle
    try {
      print("Fetching next set of data");

      _currentPage++;

      List<Wallpaper> tempWallpaperCache =
          await _wallpaperService.getListOfPhotos(_currentPage);

      print("Gotten next set of data");

      // _listOfWallpapers.addAll(tempWallpaperCache);

      // print("Paginated data === ${_listOfWallpapers.length}");


      yield HomeLoadedState(
          wallpapers:
              (state as HomeLoadedState).wallpapers + tempWallpaperCache);
    } on Failure catch (e) {
      yield HomeErrorState(e.message);
    }
  }
}
