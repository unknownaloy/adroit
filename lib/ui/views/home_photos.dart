import 'package:adroit/bloc/home/home_bloc.dart';
import 'package:adroit/bloc/home/home_events.dart';
import 'package:adroit/bloc/home/home_states.dart';
import 'package:adroit/ui/components/avatar_name.dart';
import 'package:adroit/ui/components/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePhotos extends StatefulWidget {
  const HomePhotos({Key? key}) : super(key: key);

  @override
  _HomePhotosState createState() => _HomePhotosState();
}

class _HomePhotosState extends State<HomePhotos> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(HomeFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return Text("Initial state", style: TextStyle(color: Colors.black),);
        }

        if (state is HomeLoadingState) {
          return Text("Loading", style: TextStyle(color: Colors.black),);
        }

        if (state is HomeErrorState) {
          return Text(state.errorMessage, style: TextStyle(color: Colors.black),);
        }

        if (state is HomeLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: state.wallpapers.length,
              itemBuilder: (BuildContext context, int index) {
                final wallpaper = state.wallpapers[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AvatarName(name: wallpaper.artistDetails.name,),
                    AspectRatio(
                      aspectRatio: index.isEven ? 9 / 16 : 5 / 4,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: ImageHolder(
                          imageUrl:
                          "https://image.freepik.com/free-vector/beautiful-gradient-spring-landscape_23-2148448598.jpg",
                          blurHash: wallpaper.blurHash,
                        ),
                      ),
                    ),
                  ],
                );
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 4 : 3),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          );
        }

        return Text("Something is wrong", style: TextStyle(color: Colors.black),);

        /// Data has been gotten

      },
    );
  }
}
