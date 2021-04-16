import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UiDialogHelper {
  static WidgetBuilder loadingDialog(BuildContext context) {
    return (_) => PlatformAlertDialog(
          content: Row(
            children: [
              PlatformCircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: PlatformText(AppLocalizations.of(context).loading)
              )
            ],
          ),
        );
  }

  static WidgetBuilder genericErrorAlertDialog(BuildContext context) {
    return (_) => PlatformAlertDialog(
          title: Text(AppLocalizations.of(context).warning),
          content: Text(AppLocalizations.of(context).generic_error),
          actions: <Widget>[
            PlatformDialogAction(
              child: PlatformText(AppLocalizations.of(context).loading),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
  }

  static WidgetBuilder errorAlertDialog(BuildContext context, String message) {
    return (_) => PlatformAlertDialog(
          title: PlatformText(AppLocalizations.of(context).warning),
          content: PlatformText(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            PlatformDialogAction(
              child: PlatformText(AppLocalizations.of(context).okay),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
  }
}
