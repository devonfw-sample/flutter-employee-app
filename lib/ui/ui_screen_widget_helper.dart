import 'package:devon4ng_flutter_application_template/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

class UIScreenWidgetHelper {
  static Widget itemDetail(BuildContext context, String title, String value) {
    var appTheme = Provider.of<AppTheme>(context);
    return Container(
      margin: EdgeInsets.only(bottom:10),
      padding: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Row(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: PlatformText(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: appTheme.mainTextColor),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: PlatformText(
              value,
              style: TextStyle(fontWeight: FontWeight.normal),
            )),
      ]),
    );
  }

  static Widget button(
      BuildContext context, String text, VoidCallback voidCallback) {
    var appTheme = Provider.of<AppTheme>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: PlatformButton(
        color: appTheme.bg1,
        onPressed: voidCallback,
        child: PlatformText(
          text,
          style: TextStyle(color: appTheme.mainTextColor),
        ),
      ),
    );
  }

  static Widget inputField(
      BuildContext context,
      TextEditingController textEditingController,
      TextInputType keyboardType,
      String inputDecorationLabelText,
      bool obscureText,
      double paddingTop) {
    var appTheme = Provider.of<AppTheme>(context);

    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingTop),
        child: PlatformTextField(
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: keyboardType,
          style: TextStyle(
            color: appTheme.mainTextColor,
          ),
          maxLines: keyboardType == TextInputType.multiline ? null : 1,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                labelText: inputDecorationLabelText,
                labelStyle: TextStyle(color: appTheme.mainTextColor)),
          ),
        ),
      ),
    );
  }
}
