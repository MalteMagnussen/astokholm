import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: CachedNetworkImage(
        imageUrl: "https://i.imgur.com/7UV0EdQ.png",
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onBackground, //Colors.white,
              width: 3.0,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    Theme.of(context).colorScheme.onPrimary, //Colors.white24,
                blurRadius: 5.0,
                spreadRadius: 2.5,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
              )
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
