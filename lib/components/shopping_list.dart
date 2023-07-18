import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

import 'thumbnail.dart';

class ThumbnailUtils {
  static void captureThumbnail(
      GlobalKey globalKey, BuildContext context) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();

    Provider.of<ThumbnailState>(context, listen: false).setThumbnail(image);
  }
}

class RawShoppingList extends StatelessWidget {
  RawShoppingList({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            child: Text('xxx ${index + 1}'),
          );
        },
      ),
    );
  }
}

class ShoppingList extends StatelessWidget {
  final double height;
  final double width;
  ShoppingList({super.key, required this.height, required this.width});

  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        color: Colors.white.withOpacity(0.8),
        height: height,
        width: width,
        child: RawShoppingList(),
      ),
    );
  }
}
