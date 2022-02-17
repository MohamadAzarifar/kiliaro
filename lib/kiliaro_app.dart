import 'package:flutter/material.dart';
import 'core/presentation/messages.dart';
import 'core/presentation/theme_color.dart';
import 'core/presentation/theme_text.dart';
import 'features/test_album/presentation/pages/shared_album_page.dart';

class KiliaroApp extends StatelessWidget {
  const KiliaroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Messages.app,
        theme: ThemeData(
          primaryColor: AppColor.green,
          scaffoldBackgroundColor: AppColor.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: AppThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        home: const SharedAlbumPage(),
      );
}
