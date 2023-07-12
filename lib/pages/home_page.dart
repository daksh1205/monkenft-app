import 'package:flutter/material.dart';
import 'package:nftuiapp/components/my_bottombar.dart';
import 'package:nftuiapp/tabs/recent_tab.dart';
import 'package:nftuiapp/tabs/trending_tab.dart';
import 'package:nftuiapp/tabs/top_tab.dart';
import 'package:nftuiapp/components/my_appbar.dart';
import 'package:nftuiapp/components/my_tabbar.dart';
import 'package:nftuiapp/util/glass_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // search button tapped
  void _searchButtonTapped() {}

  // our 3 tab options
  List tabOptions = const [
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()],
  ];

  // bottom bar navigation

  int _currentBottomIndex = 0;
  void _handleBottomIndexChange(int? index) {
    setState(() {
      _currentBottomIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOptions.length,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottomIndex,
            onTap: _handleBottomIndexChange,
          ),
        ),
        body: ListView(
          children: [
            // app bar + search button
            MyAppBar(
              title: 'Explore Collections',
              onTap: _searchButtonTapped,
              onSearchTap: () {},
            ),

            // tab bar
            SizedBox(
              height: 600,
              child: MyTabBar(
                tabOptions: tabOptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
