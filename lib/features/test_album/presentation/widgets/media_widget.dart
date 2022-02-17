import 'package:flutter/material.dart';
import 'package:kiliaro_test_album/core/common/components/cache_image.dart';
import 'package:kiliaro_test_album/core/common/constants/size_constants.dart';
import 'package:kiliaro_test_album/features/test_album/domain/entities/media_entity.dart';

import '../../../../core/common/components/widget_size.dart';

class MediaWidget extends StatefulWidget {
  final MediaEntity media;
  final Function(MediaEntity)? onTap;
  final bool showSize;
  final bool showProgressIndicator;
  const MediaWidget(
      {Key? key,
      required this.media,
      this.onTap,
      this.showSize = false,
      this.showProgressIndicator = false})
      : super(key: key);

  @override
  State<MediaWidget> createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  Size? containerSize;
  @override
  Widget build(BuildContext context) {
    final width = (containerSize?.width ?? 0).toInt();
    final height = (containerSize?.height ?? 0).toInt();
    return InkWell(
      onTap: (widget.onTap != null) ? () => widget.onTap!(widget.media) : null,
      child: Material(
        elevation: 1,
        child: WidgetSize(
            onChange: (Size size) => setState(() => containerSize = size),
            child: Stack(
              children: [
                if (width > 0 && height > 0)
                  CacheImage(
                      showProgressIndicator: widget.showProgressIndicator,
                      url:
                          '${widget.media.thumbnailUrl}?w=$width&h=$height&m=crop'),
                if (widget.showSize)
                  PositionedDirectional(
                      top: Sizes.dimen_4,
                      start: Sizes.dimen_4,
                      child: Text(
                        (widget.media.size / 1000000).toStringAsFixed(2) +
                            ' ' +
                            'MB',
                        style: Theme.of(context).textTheme.caption,
                      )),
              ],
            )),
      ),
    );
  }
}
