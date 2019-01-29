/*
 * Copyright (c) 2019 UIUC. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:profile_demo/utility/Utils.dart';

class RoundedImageButton extends StatelessWidget {
  final bool visible;
  final String imageRelativePath;
  final GestureTapCallback onTapGesture;
  final double sizeRatio;
  final String text;
  RoundedImageButton(
      {Key key,
      this.visible,
      this.imageRelativePath,
      this.onTapGesture,
      this.sizeRatio,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * sizeRatio;
    return Visibility(
        visible: visible,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                UiConstants.HOME_BUTTONS_PADDING_W,
                0,
                UiConstants.HOME_BUTTONS_PADDING_W,
                UiConstants.HOME_BUTTONS_SPACING),
            child: Ink(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  border: UiConstants.ROUNDED_BUTTON_BORDER,
                  color: UiConstants.APP_BRAND_COLOR,
                  image: UiUtils.buildDecorationImage(imageRelativePath),
                  shape: UiConstants.ROUNDED_BUTTON_BOX_SHAPE,
                  borderRadius: UiConstants.ROUNDED_BUTTON_BORDER_RADIUS),
              child: InkWell(
                onTap: onTapGesture,
                child: text == null || text.isEmpty
                    ? UiConstants.ROUNDED_BUTTON_PADDING
                    : new Center(
                        child: new Text(text,
                            style: UiConstants.ROUNDED_TEXT_BUTTON_STYLE)),
              ),
            )));
  }
}
