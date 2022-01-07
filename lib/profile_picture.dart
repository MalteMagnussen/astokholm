import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

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
      margin: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 15),
      child: InkWell(
        onTap: () {
          launch('https://www.linkedin.com/in/a-stokholm/');
        },
        mouseCursor: SystemMouseCursors.click,
        child: CachedNetworkImage(
          imageUrl: "https://i.imgur.com/7UV0EdQ.png",
          placeholder: (context, url) => const SizedBox(
            height: 400,
            width: 400,
            child: Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Tooltip(
            message: 'Go to LinkedIn',
            verticalOffset: height * 0.5,
            preferBelow: true,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground, //Colors.white,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary, //Colors.white24,
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
        ),
      ),
    );
  }
}
