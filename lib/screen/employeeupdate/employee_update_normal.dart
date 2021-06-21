import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';

import 'package:devon4ng_flutter_application_template/model/bloc/employeeupdate/employee_update_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeedetail/employee_detail_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_content_response_dto.dart';
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
  EmployeeDetailResponseDto? employeeDetail;
  @override
  EmployeeUpdateBloc provideBloc() {
    return EmployeeUpdateBloc();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context, AbstractBlocState state) {
    Widget body;

    if (state is EmptyInitialState) {
      EmployeeListContentResponseDto item = ModalRoute.of(context)!
          .settings
          .arguments as EmployeeListContentResponseDto;
      getBloc!.add(RetrieveEmployeeDetailBlocEvent(item.id));
    }
    if (state is OnSuccessState) {
      employeeDetail = state.data;
      body = _insertForm(context, state.data);
    } else {
      body = Container();
    }
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
        body: body);
  }

  @override
  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext context) {
    return (context, state) {
      if (state is LoadingState) {
        showDialog(
            context: context, builder: UiDialogHelper.loadingDialog(context));
        return;
      }

      if (state is OnSuccessState) {
        Navigator.pop(context);

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

  Widget _insertForm(
      BuildContext buildContext, EmployeeDetailResponseDto employeeDetail) {
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
