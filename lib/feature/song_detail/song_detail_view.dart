import 'package:flutter/material.dart';
import 'package:song/core/constants/layout_constants.dart';
import 'package:song/core/extension/context_extension.dart';
import 'package:song/product/extension/date_time_extension.dart';
import 'package:song/product/models/song/song.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView({super.key, required this.song});
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(song.artworkUrl100!),
                radius: LayoutConstants.maxSize,
              ),
            ),
            LayoutConstants.highEmptyHeight,
            LayoutConstants.highEmptyHeight,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.artistName ?? '',
                  style: TextStyle(color: context.themeData.primaryColor, fontWeight: FontWeight.bold),
                ),
                Text(song.trackName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
                Text(song.collectionName ?? '', style: TextStyle(color: context.themeData.primaryColor)),
                Text(song.releaseDate!.onlyDate, style: TextStyle(color: context.themeData.primaryColor)),
                Text('₺ ${song.trackPrice}', style: TextStyle(color: context.themeData.primaryColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
