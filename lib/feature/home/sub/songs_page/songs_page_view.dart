import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song/core/constants/layout_constants.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/init_widget_extension.dart';
import 'package:song/product/models/song/song.dart';
import 'package:song/product/extension/date_time_extension.dart';
import 'package:song/product/widget/button/card_direction_button.dart';
import 'package:song/product/widget/dialog/custom_dialog.dart';

import '../../../../product/navigate/navigation_enums.dart';
import '../../../../product/provider/song_provider.dart';

class SongsPageView extends StatelessWidget {
  const SongsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        // physics:  const PageScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: LayoutConstants.maxSize),
        // shrinkWrap: true,
        children: context.watch<SongProvider>().songList.map((e) => _songCard(context, e)).toList(),
      ),
    );
  }

  Widget _songCard(BuildContext context, Song song) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      child: InkWell(
        onTap: () => context.navigation.navigateToPage(path: NavigationEnums.songDetail.rawValue, data: song),
        child: Card(
          child: Padding(
            padding: LayoutConstants.largeAllPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        bool result = context.read<SongProvider>().deleteItem(song);
                        if (result) {
                          CustomDialog(context).show(title: 'Silme Başarılı');
                        }
                      },
                      child: const Icon(CupertinoIcons.clear_circled)),
                ),
                CircleAvatar(backgroundImage: NetworkImage(song.artworkUrl100!), radius: LayoutConstants.ultraSize),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.artistName ?? '',
                      style: TextStyle(color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
                    ),
                    Text(song.trackName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
                    Text(song.releaseDate!.onlyDate, style: TextStyle(color: context.themeData.primaryColor)),
                    Text('₺ ${song.trackPrice}', style: TextStyle(color: context.themeData.primaryColor)),
                  ],
                ),
                Align(alignment: Alignment.centerRight, child: CardDirectionButton(song: song))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
