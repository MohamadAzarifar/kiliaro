import 'package:flutter/material.dart';

class KiliaroLoadingWidget extends StatelessWidget {
  const KiliaroLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
