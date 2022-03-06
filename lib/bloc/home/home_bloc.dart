import 'package:adroit/bloc/home/home_event.dart';
import 'package:adroit/bloc/home/home_state.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:adroit/services/failure.dart';
import 'package:adroit/services/wallpaper_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WallpaperService _wallpaperService;

  HomeBloc({required WallpaperService wallpaperService})
      : _wallpaperService = wallpaperService,
        super(HomeInitialState()) {
    on<HomeFetchEvent>(_onHomeFetchEvent);
  }

  int _currentPage = 2;

  bool _isFetchingNextData = false;

  bool get isFetchingNextData => _isFetchingNextData;

  void _onHomeFetchEvent(HomeFetchEvent event, Emitter<HomeState> emit) async {
    try {
      if (state is HomeInitialState) {
        List<Wallpaper> tempWallpaperCache =
            await _wallpaperService.getListOfPhotos();

        return emit(HomeSuccessState(wallpapers: tempWallpaperCache));
      }

      if (state is HomeSuccessState) {
        _isFetchingNextData = true;

        print("Fetching next data set");

        final tempWallpaperCache =
            await _wallpaperService.getListOfPhotos(_currentPage);

        print("Finished fetching next data set");
        emit(HomeSuccessState(
            wallpapers:
                (state as HomeSuccessState).wallpapers + tempWallpaperCache));
        _isFetchingNextData = false;
        _currentPage++;
      }
    } on Failure catch (e) {
      // Do something with error
      return emit(HomeErrorState(e.message));
    }
  }
}
