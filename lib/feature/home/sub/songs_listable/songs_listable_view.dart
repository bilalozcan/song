import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/init_widget_extension.dart';
import 'package:song/product/models/song/song.dart';

import '../../../../product/lang/locale_keys.g.dart';
import '../../../../product/navigate/navigation_enums.dart';
import '../../../../product/provider/song_provider.dart';
import '../../../../product/widget/button/card_direction_button.dart';

class SongsListableView extends StatelessWidget {
  const SongsListableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            LocaleKeys.card_resultsFound.tr(namedArgs: {'count': (context.watch<SongProvider>().songList.length).toString() }),
            textAlign: TextAlign.center,
          ),
          ...context.watch<SongProvider>().songList.map((e) => _songCard(context, e)).toList(),
        ],
      ),
    );
  }

  Widget _songCard(BuildContext context, Song song) {
    return Card(
      child: ListTile(
        onTap: () => context.navigation.navigateToPage(path: NavigationEnums.songDetail.rawValue, data: song),
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
