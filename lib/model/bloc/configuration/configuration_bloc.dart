import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:devon4ng_flutter_application_template/util/platform_utils.dart';
import 'package:devon4ng_flutter_application_template/util/safe_print.dart';
import 'package:dio/dio.dart';

class ConfigurationBloc
    extends AbstractBloc<AbstractBlocEvent, AbstractBlocState> {
  ConfigurationBloc() : super(EmptyInitialState());

  @override
  Stream<AbstractBlocState> mapEventToState(AbstractBlocEvent event) async* {
    try {
      if (event is RetrieveConfigurationBlocEvent) {
        if (await hasConnectivity()) {
          yield LoadingState();

          safePrint(await PlatformUtils.getBuildNumber());
          safePrint(PlatformUtils.getChannelName());
          await Future.delayed(Duration(seconds: 2));

          yield OnSuccessState(OnSuccessState.CONFIGURATION, true);
        } else {
          yield NoConnectivityState();
        }
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

class RetrieveConfigurationBlocEvent extends AbstractBlocEvent {
  @override
  List<Object> get props => [];
}
