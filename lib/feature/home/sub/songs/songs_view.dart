import 'package:flutter/material.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/init_widget_extension.dart';
import 'package:song/product/models/song/song.dart';
import 'package:song/product/widget/cusom_progress_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../../../product/navigate/navigation_enums.dart';
import '../../../../product/widget/button/card_direction_button.dart';
import 'songs_view_model.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SongsViewModel>.reactive(
      viewModelBuilder: () => SongsViewModel(),
      builder: builder,
      onViewModelReady: (viewModel) => viewModel.onViewModelReady(context),
    );
  }

  Scaffold builder(BuildContext context, SongsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: ListView(
        controller: viewModel.scrollController,
        children: [
          ...viewModel.songs.map((e) => _songCard(context, e)).toList(),
          viewModel.isLoading
              ? const Center(child: CustomProgressIndicator())
              : viewModel.songs.isEmpty
                  ? const SizedBox()
                  : ListTile(
                      title: Center(child: Icon(Icons.keyboard_arrow_down_sharp, color: context.themeData.primaryColor,)),
                      onTap: () => viewModel.fetchSong(),
                    ),
        ],
      ),
    );
  }

  Widget _songCard(BuildContext context, Song song) {
    return Card(
      child: ListTile(
        onTap: () => context.navigation.navigateToPage(path: NavigationEnums.songDetail.rawValue, data: song),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(song.artworkUrl100!),
        ),
        title: Text(
          song.artistName ?? '',
          style: TextStyle(color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(song.trackName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
        trailing: CardDirectionButton(song: song),
      ),
    );
  }
}
