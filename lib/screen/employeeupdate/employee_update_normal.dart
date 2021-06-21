import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';

import 'package:devon4ng_flutter_application_template/model/bloc/employeeupdate/employee_update_bloc.dart';
import 'package:devon4ng_flutter_application_template/screen/abstract_state.dart';
import 'package:devon4ng_flutter_application_template/themes.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_dialog_helper.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_screen_widget_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';



class EmployeeUpdateNormalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState
    extends AbstractState<EmployeeUpdateBloc, EmployeeUpdateNormalView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();

  @override
  EmployeeUpdateBloc provideBloc() {
    return EmployeeUpdateBloc();
  }

  @override
  Widget buildWidget(BuildContext buildContext, AbstractBlocState state) {


    return PlatformScaffold(
        material: (_, __) =>
            MaterialScaffoldData(resizeToAvoidBottomInset: false),
        cupertino: (_, __) => CupertinoPageScaffoldData(
                navigationBar: CupertinoNavigationBar(
              trailing: Icon(CupertinoIcons.add),
            )),
        backgroundColor: Provider.of<AppTheme>(context).bg1,
        appBar: PlatformAppBar(
          backgroundColor: Provider.of<AppTheme>(context).mainMaterialColor,
          title: Text("Update Employee"),
        ),
        body: Center(
          child: _insertForm(buildContext),
        ));

/*

    List<Widget> children = <Widget>[];
    children.add(Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 60 / 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 64),
        child: _insertForm(buildContext),
      ),
    ));

    return PlatformScaffold(
        material: (_, __) =>
            MaterialScaffoldData(resizeToAvoidBottomInset: false),
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children));*/
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
        //Navigator.pushReplacementNamed(context, "/employeeListScreen");
        var result = true;
        Navigator.pop(context, result);

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

  validateMail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Widget _insertForm(BuildContext buildContext) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          UIScreenWidgetHelper.inputField(buildContext, _emailTextController,
              TextInputType.emailAddress, "Email", false, 32),
          UIScreenWidgetHelper.inputField(
            buildContext,
            _surnameTextController,
            TextInputType.text,
            "Username",
            false,
            32,
          ),
          UIScreenWidgetHelper.inputField(buildContext, _nameTextController,
              TextInputType.text, "Name", false, 32),
          UIScreenWidgetHelper.button(buildContext, "Insert", () {
            FocusScope.of(buildContext).requestFocus(new FocusNode());
            if (_nameTextController.text.isEmpty ||
                _surnameTextController.text.isEmpty ||
                _emailTextController.text.isEmpty) {
              showDialog(
                  context: buildContext,
                  builder: UiDialogHelper.errorAlertDialog(
                      buildContext, "Missing parameters"));
            } else {
              buildContext.read<EmployeeUpdateBloc>().add(
                  EmployeeUpdateBlocEvent(_nameTextController.text,
                      _surnameTextController.text, _emailTextController.text));
            }
          })
        ]));
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _surnameTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }
}
