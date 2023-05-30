import 'package:flutter/material.dart';
import 'package:song/core/models/simple_result.dart';
import 'package:song/product/service/song_service.dart';

import '../../../../product/base/custom_base_view_model.dart';
import '../../../../product/models/song/song.dart';

class SongsViewModel extends CustomBaseViewModel {
  final SongService _songService = SongService.instance;
  ScrollController scrollController = ScrollController();
  List<Song> songs = [];
  int offset = 0;

  bool _isLoading = false;
  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void onViewModelReady(BuildContext context) async {
    super.onViewModelReady(context);
    fetchSong();
  }

  void fetchSong() async {
    isLoading = true;
    SimpleResult result = await _songService.getSongs(offset: offset, isLimit: true);
    if (result.isSuccess) {
      songs.addAll((result.data as List).map((e) => e));
      offset++;
    }

    isLoading = false;
  }
}
