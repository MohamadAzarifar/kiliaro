import 'package:flutter/material.dart';
import 'package:kiliaro_test_album/core/presentation/widgets/app_bar_widget.dart';
import 'package:kiliaro_test_album/features/test_album/domain/entities/media_entity.dart';
import 'package:kiliaro_test_album/features/test_album/presentation/widgets/media_widget.dart';
import '../../../../core/common/utils/date_formatter.dart';

class FullScreenMediaPage extends StatelessWidget {
  final MediaEntity media;
  const FullScreenMediaPage({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KiliaroAppBar(
        title: media.createdAt.formattedDate(),
      ),
      body: MediaWidget(
        media: media,
        showProgressIndicator: true,
      ),
    );
  }
}
