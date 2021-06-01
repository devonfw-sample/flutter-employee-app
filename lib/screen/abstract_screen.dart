import 'dart:io';

import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef ViewFactory = StatefulWidget Function();

class ScreenContainer extends StatelessWidget {
  final ViewFactory normalViewFactory;
  final ViewFactory largeViewFactory;

  const ScreenContainer(this.normalViewFactory, this.largeViewFactory);

  int _computeDimensionSelector() {
    /*
    if(kIsWeb) {
      return 1536;

    } else {
      if(Platform.isAndroid) {
        return 600;
      }
      if(Platform.isIOS) {
        return 1536;
      }
    }
    */

    return 600;
  }

  @override
  Widget build(BuildContext context) {
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var width = MediaQuery.of(context).size.width;
    var dimensionSelector = _computeDimensionSelector();
    final useNormalView = width < dimensionSelector;

    safePrint("************************************************");
    safePrint("Width dimension is: $width");
    safePrint("Width dimension selector is: $dimensionSelector");
    safePrint("Use normal view: $useNormalView");
    safePrint("Device Pixel Ratio is: $devicePixelRatio");
    safePrint("************************************************");

    if (useNormalView) {
      return normalViewFactory.call();
    } else {
      return largeViewFactory.call();
    }
  }
}
