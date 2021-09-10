import 'package:adroit/bloc/home/home_events.dart';
import 'package:adroit/bloc/home/home_states.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:adroit/services/wallpaper_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {

  final WallpaperService _wallpaperService;

  HomeBloc({required WallpaperService wallpaperService})
      : _wallpaperService = wallpaperService,
        super(HomeInitialState());


  // List<Wallpaper> _wallPaperCache = [];
  //
  // List<Wallpaper> get wallPaperCache => [..._wallPaperCache];

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
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is HomeFetchEvent) {
      yield* _mapFetchWallpaperEventToState(event);
    }
  }

  Stream<HomeStates> _mapFetchWallpaperEventToState(
      HomeFetchEvent event) async* {
    yield HomeLoadingState();

    try {
      List<Wallpaper> cachedWallPaperData =
          await _wallpaperService.getListOfPhotos();

      yield HomeLoadedState(cachedWallPaperData);
    } catch (e) {
      // Do something with error
      yield HomeErrorState(e.toString());
    }
  }
}
