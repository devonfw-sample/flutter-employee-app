import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_content_response_dto.dart';
import 'package:devon4ng_flutter_application_template/screen/employeelist/view/employee_list_large_view.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_dialog_helper.dart';
import 'package:devon4ng_flutter_application_template/ui/ui_screen_widget_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devon4ng_flutter_application_template/themes.dart';
import 'package:provider/provider.dart';
import 'package:devon4ng_flutter_application_template/core_packages.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/employeelist/employee_list_bloc.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  @override
  EmployeeListBloc _bloc;
  EmployeeListContentResponseDto item;
  AbstractBlocState state;
  Detail(this._bloc, this.item, this.state);
  _DetailState createState() => _DetailState(this._bloc, this.item, this.state);
}

class _DetailState extends State<Detail> {
  EmployeeListBloc _bloc;
  EmployeeListContentResponseDto item;
  AbstractBlocState state;

  _DetailState(this._bloc, this.item, this.state);
  @override
  void initState() {
    super.initState();
    _bloc = this._bloc;
    item = this.item;
    state = this.state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.topRight,
              child: _bodyDetail(context, item),
            );
          }),
    );
  }

  Widget _bodyDetail(
      BuildContext context, EmployeeListContentResponseDto employeeDetail) {
    return Stack(children: <Widget>[
      ListView(children: [
        Container(
          height: 150,
          child: Icon(Icons.account_circle,
              color: Provider.of<AppTheme>(context).mainMaterialColor,
              size: 120),
        ),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: UIScreenWidgetHelper.itemDetail(
                context, "Id:  ", employeeDetail.id.toString())),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: UIScreenWidgetHelper.itemDetail(context, "Employee Id:  ",
                employeeDetail.employeeId.toString())),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: UIScreenWidgetHelper.itemDetail(
                context, "Name:  ", employeeDetail.name)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: UIScreenWidgetHelper.itemDetail(
                context, "Surame:  ", employeeDetail.surname)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: UIScreenWidgetHelper.itemDetail(
                context, "Email:  ", employeeDetail.email)),
      ]),
    ]);
  }

  @override
  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext context) {
    return (context, state) {
      if (state is LoadingState) {
        showDialog(
            context: context, builder: UiDialogHelper.loadingDialog(context));
      }

      if (state is OnSuccessState) {
        Navigator.pop(context);
      }

      if (state is OnErrorState) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: UiDialogHelper.errorAlertDialog(context, state.message));
      }
    };
  }
}
