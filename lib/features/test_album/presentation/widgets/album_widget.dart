import 'package:flutter/material.dart';
import 'package:kiliaro_test_album/core/presentation/messages.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../domain/entities/media_entity.dart';
import 'media_widget.dart';

class KiliaroAlbumWidget extends StatelessWidget {
  final List<MediaEntity> album;
  final Function(MediaEntity) onTap;

  const KiliaroAlbumWidget({Key? key, required this.album, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => (album.isEmpty)
      ? Center(
          child: Text(
          Messages.emptyListMessage,
          style: Theme.of(context).textTheme.bodyText1,
        ))
      : GridView.count(
          crossAxisCount: 3,
          children: album
              .map((media) => Padding(
                  padding: const EdgeInsets.all(Sizes.dimen_8),
                  child: MediaWidget(
                    media: media,
                    showSize: true,
                    showProgressIndicator: true,
                    onTap: onTap,
                  )))
              .toList(growable: false),
        );
}
