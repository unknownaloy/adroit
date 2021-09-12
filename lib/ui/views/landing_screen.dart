import 'package:adroit/bloc/home/home_bloc.dart';
import 'package:adroit/bloc/home/home_event.dart';
import 'package:adroit/services/wallpaper_service.dart';
import 'package:adroit/ui/views/home_photos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adroit/ui/components/custom_persistent_header.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _client = http.Client;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                delegate: CustomPersistentHeader(
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Theme.of(context).accentColor,
                    labelStyle: Theme.of(context).textTheme.headline6,
                    tabs: [
                      Text(AppLocalizations.of(context)!.home),
                      Text(AppLocalizations.of(context)!.recommendations),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                BlocProvider<HomeBloc>(
                  create: (context) =>
                      HomeBloc(wallpaperService: WallpaperService())
                        ..add(
                          HomeFetchEvent(),
                        ),
                  child: HomePhotos(),
                ),
                Text(
                  "the other side",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
