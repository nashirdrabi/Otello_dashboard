//this file contain common functions and widgets used all over the app

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Widget getAssetImage(String assetName,
    {double? height, double? width, BoxFit? fit, double? scale}) {
  return Image.asset(
    "assets/images/$assetName",
    height: height,
    width: width,
    fit: fit,
    scale: scale,
  );
}

Widget getNetworkImage(String url,
    {double? height,
    double? width,
    BoxFit? fit,
    double? scale,
    Widget? categoryWidget,
    bool? useProvider}) {
  return CachedNetworkImage(
    fit: fit,
    height: height,
    width: width,
    imageUrl: url,
    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Shimmer(
      color: Colors.grey.shade500,
      child: Container(),
    )),
    errorWidget: (context, url, error) =>
        categoryWidget ??
        getNetworkImage(
            'https://www.anelto.com/wp-content/uploads/2021/08/placeholder-image.png'),
  );
}

class PagePadding extends StatelessWidget {
  final Widget child;

  const PagePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            left: MediaQuery.of(context).size.width * 0.04,
            bottom: MediaQuery.of(context).size.width * 0.04),
        child: child);
  }
}

class AlternateRichText extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final TextStyle styleOne;
  final TextStyle styleTwo;
  AlternateRichText(
      {required this.textOne,
      required this.textTwo,
      required styleOne,
      required styleTwo})
      : styleOne = styleOne,
        styleTwo = styleTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(textOne, style: styleOne),
          ],
        ),
        Column(
          children: [
            Text(textTwo, style: styleTwo),
          ],
        )
      ],
    );
  }
}
