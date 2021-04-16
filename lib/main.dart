// @dart=2.9

import 'package:devon4ng_flutter_application_template/model/bloc/simple_bloc_observer.dart';
import 'package:devon4ng_flutter_application_template/screen/abstract_screen.dart';
import 'package:devon4ng_flutter_application_template/screen/authentication/view/login_large_view.dart';
import 'package:devon4ng_flutter_application_template/screen/authentication/view/login_normal_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeedetail/view/employee_detail_large_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeedetail/view/employee_detail_normal_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeeinsert/view/employee_insert_large_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeeinsert/view/employee_insert_normal_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeelist/view/employee_list_large_view.dart';
import 'package:devon4ng_flutter_application_template/screen/employeelist/view/employee_list_normal_view.dart';
import 'package:devon4ng_flutter_application_template/screen/splash/view/splash_large_view.dart';
import 'package:devon4ng_flutter_application_template/screen/splash/view/splash_normal_view.dart';
import 'package:devon4ng_flutter_application_template/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiProvider(providers: [
    Provider(create: (context) => AppTheme.fromType(ThemeType.Theme_Light))
  ], child: AppBootstrapper()));
}

class AppBootstrapper extends StatefulWidget {
  @override
  _AppBootstrapperState createState() => _AppBootstrapperState();
}

typedef ViewFactory = StatefulWidget Function();

class _AppBootstrapperState extends State<AppBootstrapper> {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Devon4ng Flutter Application Template',
      supportedLocales: [
        Locale('en'),
        Locale('it'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      /*
      material: (_, __) => MaterialAppData(
        theme: new ThemeData(
            primarySwatch: appModel.theme.mainMaterialColor,
            hintColor: appModel.theme.hintColor,
            inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0)))),
      ),
      cupertino: (_, __) => CupertinoAppData(
          theme: CupertinoThemeData(
        primaryColor: appModel.theme.mainCupertinoColor,
        barBackgroundColor: appModel.theme.barBackgroundCupertinoColor,
      )),
      */
      initialRoute: "/splashScreen",
      routes: <String, WidgetBuilder>{
        "/splashScreen": (context) => ScreenContainer(
              () => SplashNormalView(),
              () => SplashLargeView(),
            ),
        "/loginScreen": (context) => ScreenContainer(
              () => LoginNormalView(),
              () => LoginLargeView(),
            ),
        "/employeeDetailScreen": (context) => ScreenContainer(
              () => EmployeeDetailNormalView(),
              () => EmployeeDetailLargeView(),
            ),
        "/employeeListScreen": (context) => ScreenContainer(
              () => EmployeeListNormalView(),
              () => EmployeeListLargeView(),
            ),
        "/employeeInsertScreen": (context) => ScreenContainer(
              () => EmployeeInsertNormalView(),
              () => EmployeeInsertLargeView(),
            ),
      },
    );
  }
}
