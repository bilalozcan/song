import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/song/song.dart';

class CardDirectionButton extends StatelessWidget {
  const CardDirectionButton({super.key, required this.song});
  final Song song;

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.square_arrow_right_fill,
      color: Colors.white,
    );
  }
}
