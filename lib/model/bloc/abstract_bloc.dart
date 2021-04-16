import 'package:devon4ng_flutter_application_template/util/platform_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractBloc<AbstractBlocEvent, AbstractBlocState>
    extends Bloc<AbstractBlocEvent, AbstractBlocState> {
  AbstractBloc(AbstractBlocState initialState) : super(initialState);

  Future<bool> hasConnectivity() async {
    return await PlatformUtils.hasConnectivity() == true;
  }
}
