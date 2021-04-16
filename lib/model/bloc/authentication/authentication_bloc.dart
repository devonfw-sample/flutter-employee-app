import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/model/repository/authentication_repository.dart';
import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:dio/dio.dart';

class AuthenticationBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  AuthenticationBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (event is AuthenticateBlocEvent) {
        if (await hasConnectivity()) {
          yield LoadingState();

          var repository = AuthenticationRepository();
          var response = await repository.login(event.username, event.password);
          yield OnSuccessState(OnSuccessState.LOGIN, response);
        } else {
          yield NoConnectivityState();
        }
      }
    } catch (e) {
      safePrint(e);
      if (e is DioError && e.response != null) {
        safePrint('${e.response.statusCode} - ${e.response.statusMessage}');
      }

      yield OnErrorState(
          OnErrorState.GENERIC_ERROR_CODE, OnErrorState.GENERIC_ERROR_MESSAGE);
    }
  }
}

class AuthenticateBlocEvent extends AbstractBlocEvent {
  final String username;
  final String password;

  AuthenticateBlocEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
