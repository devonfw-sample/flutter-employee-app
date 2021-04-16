import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/repository/employee_repository.dart';
import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:dio/dio.dart';

class EmployeeListBloc extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  
  EmployeeListBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (await hasConnectivity()) {
        if(event is DeleteEmployeeBlocEvent) {
          yield LoadingState();

          var repository = EmployeeListRepository();
          await repository.delete(event.id);
          yield OnSuccessState(OnSuccessState.EMPLOYEE_DELETE, true);
        }



        if (event is RetrieveEmployeeListBlocEvent) {          
            yield LoadingState();

            var repository = EmployeeListRepository();
            var response = await repository.search(15, 0);
            yield OnSuccessState(OnSuccessState.EMPLOYEE_LIST, response);
        }

      } else {
        yield NoConnectivityState();
      }

    } catch (e) {
      safePrint(e);
      if (e is DioError) {
        if(e.response != null) {
          safePrint('${e.response.statusCode} - ${e.response.statusMessage}');
        }
      }

      yield OnErrorState(OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}


class RetrieveEmployeeListBlocEvent extends AbstractBlocEvent {
  
  @override
  List<Object> get props => [];
}

class DeleteEmployeeBlocEvent extends AbstractBlocEvent {

  final int id;

  DeleteEmployeeBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}