import 'package:equatable/equatable.dart';

abstract class AbstractBlocState extends Equatable {}

class EmptyInitialState extends AbstractBlocState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AbstractBlocState {
  @override
  List<Object> get props => [];
}

class NoConnectivityState extends AbstractBlocState {
  @override
  List<Object> get props => [];
}

class OnSuccessState<Any> extends AbstractBlocState {
  static const int CONFIGURATION = 1;
  static const int LOGIN = 2;
  static const int EMPLOYEE_LIST = 3;
  static const int EMPLOYEE_DETAIL = 4;
  static const int EMPLOYEE_DELETE = 5;
  static const int EMPLOYEE_UPDATE = 6;

  final int id;
  final Any data;

  OnSuccessState(this.id, this.data);

  @override
  List<Object> get props => [data!];
}

class OnErrorState extends AbstractBlocState {
  static const GENERIC_ERROR_CODE = 100;
  static const GENERIC_ERROR_MESSAGE = "GENERIC ERROR";

  final int code;
  final String message;

  OnErrorState(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}
