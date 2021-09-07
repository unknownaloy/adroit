import 'package:adroit/bloc/home/home_events.dart';
import 'package:adroit/bloc/home/home_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class HomeBloc extends HydratedBloc<HomeEvents, HomeStates> {

  HomeBloc(HomeStates state) : super(state); // HomeInitialState()



  // HomeBloc(HomeStates initialState) : super(initialState);

  @override
  HomeStates? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(HomeStates state) {
    // TODO: implement toJson
    if (state is HomeLoadedState) {
      for (final wallpaper in state.wallpapers) {
        return wallpaper.toJson();
      }
    }
  }

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is HomeFetchEvent) {
      yield* _mapFetchWallpaperEventToState(event);
    }
  }

  Stream<HomeStates> _mapFetchWallpaperEventToState(
      HomeFetchEvent event) async* {
    yield HomeLoadingState();
  }
}
