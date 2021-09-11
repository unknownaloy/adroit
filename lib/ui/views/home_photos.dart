import 'package:adroit/bloc/home/home_bloc.dart';
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

class _HomePhotosState extends State<HomePhotos>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;

  void _scrollListener() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.height * 0.20;

    // if (_scrollController.offset >=
    //     _scrollController.position.maxScrollExtent &&
    //     !_scrollController.position.outOfRange) {
    //   if (!viewModel.hasGottenNextDocData && viewModel.hasMoreDocuments) {
    //     viewModel.setCircularProgress(true);
    //   } else {
    //     viewModel.setCircularProgress(false);
    //   }
    // }
    //
    // if (maxScroll - currentScroll <= delta) {
    //   viewModel.setShouldCheck(true);
    //   if (viewModel.shouldRunCheck) {
    //     viewModel.fetchPaginatedData(
    //           () => viewModel.fetchNextData(),
    //     );
    //   }
    // }

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("Gotten to the bottom of the screen");
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return Text(
            "Initial state",
            style: TextStyle(color: Colors.black),
          );
        }

        if (state is HomeLoadingState) {
          return Text(
            "Loading",
            style: TextStyle(color: Colors.black),
          );
        }

        if (state is HomeErrorState) {
          return Text(
            state.errorMessage,
            style: TextStyle(color: Colors.black),
          );
        }

        if (state is HomeLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 4,
              itemCount: state.wallpapers.length,
              itemBuilder: (BuildContext context, int index) {
                final wallpaper = state.wallpapers[index];
                print("COLOR => ${wallpaper.color} $index");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: index == 1
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AvatarName(
                      artistImage: wallpaper.artistDetails.artistImage.small,
                      artistName: wallpaper.artistDetails.name,
                    ),
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: index.isEven ? 9 / 16 : 5 / 4,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: ImageHolder(
                            imageUrl: wallpaper.imageUrl.small,
                            blurHash: wallpaper.blurHash,
                          ),
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

        return Text(
          "Something is wrong",
          style: TextStyle(color: Colors.black),
        );

        /// Data has been gotten
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
