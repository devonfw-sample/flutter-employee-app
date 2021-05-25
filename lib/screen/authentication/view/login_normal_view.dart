import 'package:devon4ng_flutter_application_template/core_packages.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/authentication/authentication_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/screen/abstract_state.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_dialog_helper.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_screen_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

class LoginNormalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends AbstractState<AuthenticationBloc, LoginNormalView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  AuthenticationBloc provideBloc() {
    return AuthenticationBloc();
  }

  @override
  Widget buildWidget(BuildContext buildContext, AbstractBlocState state) {
    double minWidth = 250;
    double maxWidth = MediaQuery.of(context).size.width * 50 / 100;
    if (maxWidth < minWidth) {
      maxWidth = minWidth;
    }
    double minHeight = 250;
    double maxHeight = MediaQuery.of(context).size.height * 60 / 100;
    if (maxHeight < minHeight) {
      maxHeight = minHeight;
    }

    var b1 = Container(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      decoration: BoxDecoration(
        color: Provider.of<AppTheme>(context).bg1,
        border: Border.all(
          color: Provider.of<AppTheme>(context).accent1!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(child: _loginForm(buildContext)),
      ),
    );

    List<Widget> children = <Widget>[];
    children.add(b1);

    return PlatformScaffold(
        material: (_, __) =>
            MaterialScaffoldData(resizeToAvoidBottomInset: false),
        backgroundColor: Provider.of<AppTheme>(context).bg1,
        body: Center(child: b1));
  }

  @override
  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext buildContext) {
    return (context, state) {
      if (state is LoadingState) {
        showDialog(
            context: context, builder: UiDialogHelper.loadingDialog(context));
        return;
      }

      if (state is OnSuccessState) {
        Navigator.pop(context);
        //List<Cookie> results = CookieJar().loadForRequest(Uri.parse("http://10.24.219.91:8081"));
        //print(results);

        //Navigator.pushReplacementNamed(context, "/employeeDetailScreen");
        Navigator.pushReplacementNamed(context, "/employeeListScreen");
        return;
      }

      if (state is OnErrorState) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: UiDialogHelper.errorAlertDialog(context, state.message));
        return;
      }
    };
  }

  Widget _loginForm(BuildContext buildContext) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Icon(Icons.login,
                  size: 50,
                  color: Provider.of<AppTheme>(context).mainMaterialColor),
              UIScreenWidgetHelper.inputField(
                  buildContext,
                  _usernameTextController,
                  TextInputType.emailAddress,
                  AppLocalizations.of(buildContext)!.username,
                  false,
                  32),
              UIScreenWidgetHelper.inputField(
                buildContext,
                _passwordTextController,
                TextInputType.text,
                AppLocalizations.of(buildContext)!.password,
                true,
                16,
              ),
              UIScreenWidgetHelper.button(
                  buildContext, AppLocalizations.of(buildContext)!.login, () {
                _usernameTextController.text = "admin";
                _passwordTextController.text = "admin";

                FocusScope.of(buildContext).requestFocus(new FocusNode());
                if (_usernameTextController.text.isEmpty ||
                    _passwordTextController.text.isEmpty) {
                  showDialog(
                      context: buildContext,
                      builder: UiDialogHelper.errorAlertDialog(
                          buildContext,
                          AppLocalizations.of(buildContext)!
                              .missing_credential_params));
                } else {
                  buildContext.read<AuthenticationBloc>().add(
                      AuthenticateBlocEvent(_usernameTextController.text,
                          _passwordTextController.text));
                }
              })
            ]))));
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
