import 'package:bloc/bloc.dart';
import 'package:graduation_project/business_logic/repo/repository.dart';
import 'package:graduation_project/data/find_doctor_models.dart';
import 'package:meta/meta.dart';

part 'findalldoctor_state.dart';

class FindalldoctorCubit extends Cubit<FindalldoctorState> {
  FindalldoctorCubit() : super(FindalldoctorInitial());

  Future<void> findalldoctorss(String token) async {
    emit(FindalldoctorLoading());
    try {
      final response = await HomeRepo().findalldoctor('doctor/findalldoctors', token);
      final doctorsList = parseDoctorsList(response as List<dynamic>);
      emit(FindalldoctorSuccess(
        doctorsList,
      ));
    } catch (e) {
      emit(FindalldoctorError('Something went wrong. Please try again.'));
    }
  }
}
