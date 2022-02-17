import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiliaro_test_album/core/presentation/messages.dart';
import 'package:kiliaro_test_album/core/presentation/widgets/app_error_widget.dart';
import 'package:kiliaro_test_album/features/test_album/presentation/pages/full_screen_media_page.dart';
import '../../../../core/presentation/widgets/app_bar_widget.dart';

import '../../../../core/presentation/widgets/loading_widget.dart';
import '../../../../di/get_it.dart';
import '../bloc/bloc/shared_album_bloc.dart';
import '../widgets/album_widget.dart';

class SharedAlbumPage extends StatelessWidget {
  const SharedAlbumPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => di<SharedAlbumBloc>()..add(SharedAlbumGetEvent()),
        child: const SharedAlbumView(),
      );
}

class SharedAlbumView extends StatelessWidget {
  const SharedAlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: KiliaroAppBar(
          title: Messages.app,
          onRefresh: () =>
              context.read<SharedAlbumBloc>().add(SharedAlbumRefreshEvent()),
        ),
        body: BlocBuilder<SharedAlbumBloc, SharedAlbumState>(
          builder: (context, state) {
            if (state.status == SharedAlbumStatus.failure) {
              return KiliaroErrorWidget(failure: state.failure!);
            } else if (state.status == SharedAlbumStatus.success) {
              return KiliaroAlbumWidget(
                album: state.album,
                onTap: (media) async => await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FullScreenMediaPage(media: media))),
              );
            } else {
              return const KiliaroLoadingWidget();
            }
          },
        ),
      );
}
