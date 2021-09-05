import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adroit/ui/components/custom_persistent_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
                Text(
                  "Something just like this",
                  style: Theme.of(context).textTheme.bodyText1,
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
