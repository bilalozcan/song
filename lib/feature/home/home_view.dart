import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:song/core/constants/layout_constants.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/feature/home/sub/songs/songs_view.dart';
import 'package:song/feature/home/sub/songs_listable/songs_listable_view.dart';
import 'package:song/product/constants/image_constants.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';
import 'sub/songs_grid/songs_grid_view.dart';
import 'sub/songs_page/songs_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: builder,
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(context),
    );
  }

  Scaffold builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: context.themeData.cardColor,
      appBar: AppBar(
        backgroundColor: context.themeData.cardTheme.color,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(ImageConstants.instance.avatar)),
            LayoutConstants.centralEmptyWidth,
            const Text(
              'Bilal Özcan',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: viewModel.tabController,
        screens: _buildScreens(),
        items: _navBarsItems(context),
        confineInSafeArea: true,
        backgroundColor: context.themeData.cardTheme.color!,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: context.themeData.primaryColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style14, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const SongsView(),
      const SongsListableView(),
      const SongsGridView(),
      const SongsPageView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      _persistentNavBarItem(context, 'Songs', Icons.music_note),
      _persistentNavBarItem(context, 'List', CupertinoIcons.list_bullet),
      _persistentNavBarItem(context, 'Grid', CupertinoIcons.square_grid_2x2),
      _persistentNavBarItem(context, 'Page', CupertinoIcons.square_stack_3d_down_right),
    ];
  }

  PersistentBottomNavBarItem _persistentNavBarItem(BuildContext context, String title, IconData iconData) {
    return PersistentBottomNavBarItem(
      icon: Icon(iconData),
      title: title,
      activeColorPrimary: context.themeData.primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }
}
