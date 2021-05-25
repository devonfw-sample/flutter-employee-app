import 'package:devon4ng_flutter_application_template/config/size_config.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/abstract_bloc.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_event.dart';
import 'package:devon4ng_flutter_application_template/model/bloc/bloc_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractState<
    B extends AbstractBloc<AbstractBlocEvent, AbstractBlocState>,
    W extends StatefulWidget> extends State<W> {
  B? _bloc;
  B? get getBloc => _bloc;

  B provideBloc();

  Widget buildWidget(BuildContext buildContext, AbstractBlocState state);

  BlocWidgetListener<AbstractBlocState> provideBlocListener(
      BuildContext buildContext);

  BlocWidgetBuilder<AbstractBlocState> provideBlocBuilder(
      BuildContext buildContext) {
    return (buildContext, state) {
      return buildWidget(buildContext, state);
    };
  }

  @override
  void initState() {
    super.initState();
    _bloc = provideBloc();
  }

  @override
  Widget build(BuildContext buildContext) {
    SizeConfig().init(context);
    return Container(
        child: MultiBlocProvider(
            providers: [
          BlocProvider<B>(
            create: (BuildContext buildContext) => _bloc!,
          )
        ],
            child: BlocListener<B, AbstractBlocState>(
                bloc: _bloc,
                listener: provideBlocListener(buildContext),
                child: BlocBuilder<B, AbstractBlocState>(
                    bloc: _bloc, builder: provideBlocBuilder(buildContext)))));
  }
}
