part of 'braintest_cubit.dart';

@immutable
abstract class BraintestState {}

 class BraintestInitial extends BraintestState {}
class BraintestLoading extends BraintestState {}
class BraintestSuccess extends BraintestState {
  final UserDataResponse message;
  BraintestSuccess(this.message);
}
class BraintestError extends BraintestState {
  final String error;
  BraintestError(this.error);
}
