import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    required this.url,
    this.showProgressIndicator = false,
  }) : super(key: key);
  final String url;
  final bool showProgressIndicator;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => showProgressIndicator
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
