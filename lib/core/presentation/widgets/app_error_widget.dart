import 'package:flutter/material.dart';
import 'package:kiliaro_test_album/core/error/failures.dart';

class KiliaroErrorWidget extends StatelessWidget {
  const KiliaroErrorWidget({Key? key, required this.failure}) : super(key: key);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(failure.toString()),
    );
  }
}
