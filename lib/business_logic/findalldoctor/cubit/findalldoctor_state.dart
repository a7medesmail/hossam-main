part of 'findalldoctor_cubit.dart';

@immutable
abstract class FindalldoctorState {}

class FindalldoctorInitial extends FindalldoctorState {}

class FindalldoctorLoading extends FindalldoctorState {}

class FindalldoctorSuccess extends FindalldoctorState {
  final List<FindalldoctorModels> doctors;
  FindalldoctorSuccess(this.doctors);
}

class FindalldoctorError extends FindalldoctorState {
  final String error;
  FindalldoctorError(this.error);
}
