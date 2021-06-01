import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/employeedetail/employee_detail_bloc.dart';
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

class EmployeeDetailNormalView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState
    extends AbstractState<EmployeeDetailBloc, EmployeeDetailNormalView> {
  //final floatingButtons = <UnicornButton>[];
  EmployeeDetailResponseDto? employeeDetail;
  BuildContext? widgetBC;

  @override
  EmployeeDetailBloc provideBloc() {
    return EmployeeDetailBloc();
  }

  showDeleteDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        //provideBloc().add(DeleteEmployeeBlocEvent(employeeDetail.id));
        widgetBC!
            .read<EmployeeDetailBloc>()
            .add(DeleteEmployeeBlocEvent(employeeDetail!.id));
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete employee"),
      content: Text(
          "Press Continue button to delete the employee from the list below"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    /*floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Insert",
        currentButton: FloatingActionButton(
          heroTag: "insert",
          backgroundColor: Colors.black,
          mini: true,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/employeeInsertScreen");
          },
        ),
      ),
    );*/

    /*
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Delete",
        currentButton: FloatingActionButton(
          onPressed: () {
            showDeleteDialog(context);
          },
          heroTag: "delete",
          backgroundColor: Colors.black,
          mini: true,
          child: Icon(Icons.delete),
        ),
      ),
    );
    */
    super.initState();
  }

  Widget buildWidget(BuildContext context, AbstractBlocState state) {
    Widget body;
    widgetBC = context;

    if (state is EmptyInitialState) {
      EmployeeListContentResponseDto item = ModalRoute.of(context)!
          .settings
          .arguments as EmployeeListContentResponseDto;
      getBloc!.add(RetrieveEmployeeDetailBlocEvent(item.id));
    }

    if (state is OnSuccessState) {
      employeeDetail = state.data;
      body = _bodyDetail(context, state.data);
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
          title: Text("Employee"),
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
      }

      if (state is OnSuccessState) {
        Navigator.pop(context);

        if (state.id == OnSuccessState.EMPLOYEE_DELETE) {
          //EMPLOYEE_DELETE
          Navigator.pushReplacementNamed(context, "/employeeListScreen");
        }
      }

      if (state is OnErrorState) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: UiDialogHelper.errorAlertDialog(context, state.message));
      }
    };
  }

  Widget _bodyDetail(
      BuildContext context, EmployeeDetailResponseDto employeeDetail) {
    return Stack(children: <Widget>[
      ListView(children: [
        Container(
          height: 150,
          child: Icon(Icons.account_circle,

              color: Provider.of<AppTheme>(context).mainMaterialColor, size:120),

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

      /*
      Positioned(
          bottom: 20,
          right: 20,
          height: 300,
          child: UnicornDialer(
              backgroundColor: Colors.black38,
              parentButtonBackground:
                  Provider.of<AppTheme>(context).mainMaterialColor,
              orientation: UnicornOrientation.VERTICAL,
              parentButton: Icon(Icons.add),
              childButtons: floatingButtons))
              */
    ]);

    /* FabCircularMenu(children: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('Inserisci');
                Navigator.pushReplacementNamed(context, "/employeInsertScreen");
                return;
              }),
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print('Elimina');
              })
        ]),*/
  }
}
