import 'package:flutter/material.dart';
import 'package:song/product/service/song_service.dart';

import '../../core/models/simple_result.dart';
import '../models/song/song.dart';

class SongProvider extends ChangeNotifier {
  final SongService _songService = SongService.instance;
  List<Song> songList = [];
  SongProvider() {
    fetchSong();
  }

  fetchSong() async {
    SimpleResult result = await _songService.getSongs();
    if (result.isSuccess) {
      songList.addAll((result.data as List).map((e) => e));
      notifyListeners();
    }
  }

  bool deleteItem(Song song) {
    var result = songList.remove(song);
    if (result) {
      notifyListeners();
    }
    return result;
  }
}
