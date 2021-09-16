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

  @override
  HomeState get state => HomeInitialState();

  int _currentPage = 2;

  bool _isFetchingNextData = false;

  bool get isFetchingNextData => _isFetchingNextData;

  bool _hasReachedMax(HomeState state) =>
      state is HomeSuccessState && state.hasReachedMax;

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
    if (event is HomeFetchEvent && !_hasReachedMax(state)) {
      yield* _mapHomeFetchEventToState(event);
    }
  }

  Stream<HomeState> _mapHomeFetchEventToState(HomeFetchEvent event) async* {
    try {
      if (state is HomeInitialState) {
        List<Wallpaper> tempWallpaperCache =
            await _wallpaperService.getListOfPhotos();

        yield HomeSuccessState(
          wallpapers: tempWallpaperCache,
          hasReachedMax: false,
        );
      }

      if (state is HomeSuccessState) {
        _isFetchingNextData = true;

        print("Fetching next data set");


        final tempWallpaperCache =
            await _wallpaperService.getListOfPhotos(_currentPage);

        print("Finished fetching next data set");

        yield tempWallpaperCache.isEmpty
            ? (state as HomeSuccessState).copyWith(hasReachedMax: true)
            : HomeSuccessState(
                wallpapers:
                    (state as HomeSuccessState).wallpapers + tempWallpaperCache,
                hasReachedMax: false,
              );
        _isFetchingNextData = false;
        _currentPage++;
      }
    } on Failure catch (e) {
      // Do something with error
      yield HomeErrorState(e.message);
    }
  }
}
