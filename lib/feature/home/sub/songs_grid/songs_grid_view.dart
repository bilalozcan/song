import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/init_widget_extension.dart';
import 'package:song/product/models/song/song.dart';
import 'package:song/product/provider/song_provider.dart';

import '../../../../product/navigate/navigation_enums.dart';
import '../../../../product/widget/button/card_direction_button.dart';

class SongsGridView extends StatelessWidget {
  const SongsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: context.watch<SongProvider>().songList.map((e) => _songCard(context, e)).toList(),
      ),
    );
  }

  Widget _songCard(BuildContext context, Song song) {
    return InkWell(
      onTap: () => context.navigation.navigateToPage(path: NavigationEnums.songDetail.rawValue, data: song),
      child: Card(
        child: Center(
          child: ListTile(
            title: Text(
              song.artistName ?? '',
              style: TextStyle(color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(song.trackName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
            trailing: CardDirectionButton(song: song),
          ),
        ),
      ),
    );
  }
}
