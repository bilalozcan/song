import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:song/core/constants/layout_constants.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/date_time_extension.dart';
import 'package:song/product/lang/locale_keys.g.dart';
import 'package:song/product/models/song/song.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView({super.key, required this.song});
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.themeData.primaryColor,
      appBar: AppBar(
        backgroundColor: context.themeData.cardTheme.color,
        title: Text(song.artistName!, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: LayoutConstants.largeAllPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.dynamicHeight(0.2),
                width: context.dynamicWidth(0.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
                  image: DecorationImage(image: NetworkImage(song.artworkUrl100!), fit: BoxFit.cover),
                ),
              ),
            ),
            LayoutConstants.highEmptyHeight,
            LayoutConstants.highEmptyHeight,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      song.artistName ?? '',
                      style: TextStyle(color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(song.trackName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(song.collectionName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title: Text(
                            LocaleKeys.card_releaseDate.tr(),
                            style: TextStyle(
                                fontSize: 12, color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            song.releaseDate!.onlyDate,
                            style: TextStyle(color: context.themeData.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: ListTile(
                          title: Text(
                            LocaleKeys.card_price.tr(),
                            style: TextStyle(
                                fontSize: 12, color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '₺ ${song.trackPrice}',
                            style: TextStyle(color: context.themeData.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
