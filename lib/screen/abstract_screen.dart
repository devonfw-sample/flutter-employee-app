import 'dart:io';

import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef ViewFactory = StatefulWidget Function();

class ScreenContainer extends StatelessWidget {
  final ViewFactory normalViewFactory;
  final ViewFactory largeViewFactory;

  const ScreenContainer(this.normalViewFactory, this.largeViewFactory);

  int _computeDimensionSelector(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 1536) {
      return 1920;
    } else {
      if (MediaQuery.of(context).size.width >= 600) {
        return 1536;
      } else {
        return 300;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var width = MediaQuery.of(context).size.width;
    var dimensionSelector = _computeDimensionSelector(context);
    final useLargeView = width < dimensionSelector;

    safePrint("************************************************");
    safePrint("Width dimension is: $width");
    safePrint("Width dimension selector is: $dimensionSelector");
    safePrint("Use large view: $useLargeView");
    safePrint("Device Pixel Ratio is: $devicePixelRatio");
    safePrint("************************************************");

    if (useLargeView) {
      return largeViewFactory.call();
    } else {
      return normalViewFactory.call();
    }
  }
}
