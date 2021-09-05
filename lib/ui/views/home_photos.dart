import 'package:adroit/ui/components/avatar_name.dart';
import 'package:adroit/ui/components/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePhotos extends StatelessWidget {
  const HomePhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AvatarName(),
            AspectRatio(
              aspectRatio: index.isEven ? 9 / 16 : 5 / 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: ImageHolder(
                  imageUrl:
                      "https://image.freepik.com/free-vector/beautiful-gradient-spring-landscape_23-2148448598.jpg",
                  blurHash: "LaO:z^IVbcoI?woJadbI4TWVbcj?",
                ),
              ),
            ),
          ],
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 4 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
