import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/repository/employee_repository.dart';
import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:dio/dio.dart';

class EmployeeDetailBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  EmployeeDetailBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (await hasConnectivity()) {
        if (event is RetrieveEmployeeDetailBlocEvent) {
          yield LoadingState();

          var repository = EmployeeListRepository();
          var response = await repository.getDetail(event.id);
          yield OnSuccessState(OnSuccessState.EMPLOYEE_DETAIL, response);
        }
        if (event is DeleteEmployeeBlocEvent) {
          yield LoadingState();

          var repository = EmployeeListRepository();
          var response = await repository.delete(event.id);
          yield OnSuccessState(OnSuccessState.EMPLOYEE_DELETE, response);
        }
      } else {
        yield NoConnectivityState();
      }
    } catch (e) {
      safePrint(e);
      if (e is DioError) {
        safePrint('${e.response.statusCode} - ${e.response.statusMessage}');
      }

      yield OnErrorState(
          OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}

class RetrieveEmployeeDetailBlocEvent extends AbstractBlocEvent {
  final int id;

  RetrieveEmployeeDetailBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteEmployeeBlocEvent extends AbstractBlocEvent {
  final int id;

  DeleteEmployeeBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}
