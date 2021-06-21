import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/repository/employee_repository.dart';
import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:dio/dio.dart';

class EmployeeUpdateBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  EmployeeUpdateBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (event is EmployeeUpdateBlocEvent) {
        if (await hasConnectivity()) {
          yield LoadingState();

          var repository = EmployeeListRepository();
          var response =
              await repository.update(event.name, event.surname, event.email);
          yield OnSuccessState(OnSuccessState.LOGIN, response);
        } else {
          yield NoConnectivityState();
        }
      }
    } catch (e) {
      safePrint(e);
      if (e is DioError) {
        var statusCode = e.response!.statusCode;
        var statusMessage = e.response!.statusMessage;
        safePrint('$statusCode - $statusMessage');
      }

      yield OnErrorState(
          OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}

class EmployeeUpdateBlocEvent extends AbstractBlocEvent {
  final String name;
  final String surname;
  final String email;

  EmployeeUpdateBlocEvent(this.name, this.surname, this.email);

  @override
  List<Object> get props => [name, surname, email];
}
