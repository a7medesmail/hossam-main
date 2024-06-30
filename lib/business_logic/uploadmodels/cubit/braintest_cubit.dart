import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/business_logic/repo/repository.dart';
import 'package:graduation_project/data/test.dart';
import 'package:meta/meta.dart';

part 'braintest_state.dart';

class BraintestCubit extends Cubit<BraintestState> {
  BraintestCubit() : super(BraintestInitial());

  Future<void> uploadBrainTest({required MultipartFile image, required String token}) async {
    emit(BraintestLoading());
    try {
      final response = await HomeRepo().breastcanser('ai/upload-brain-tumor', token, image);
      final message = UserDataResponse.fromJson(response);
      emit(BraintestSuccess(message));
    } catch (e) {
      emit(BraintestError('Something went wrong. Please try again.'));
}
  }
}