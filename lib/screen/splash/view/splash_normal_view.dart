import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/configuration/configuration_bloc.dart';
import 'package:devon4ng_flutter_application_template/screen/abstract_state.dart';
import 'package:devon4ng_flutter_application_template/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashNormalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends AbstractState<ConfigurationBloc, SplashNormalView> {
  @override
  ConfigurationBloc provideBloc() {
    return ConfigurationBloc();
  }

  @override
  Widget buildWidget(BuildContext buildContext, AbstractBlocState state) {
    return Container(
      child: Center(
          child: Image(
              image: AssetImage('assets/images/flutter_logo.png'), width: 300)),
      color: Provider.of<AppTheme>(buildContext).bg1,
    );
  }

  @override
  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext buildContext) {
    return (context, state) {
      if (state is OnSuccessState) {
        Navigator.pushReplacementNamed(context, "/loginScreen");
        return;
      }
    };
  }

  @override
  void initState() {
    super.initState();
    getBloc.add(RetrieveConfigurationBlocEvent());
  }
}
