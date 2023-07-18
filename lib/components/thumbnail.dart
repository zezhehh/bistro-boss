import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ThumbnailState extends ChangeNotifier {
  ui.Image? thumbnailImage;

  void setThumbnail(ui.Image image) {
    thumbnailImage = image;
    notifyListeners();
  }
}
