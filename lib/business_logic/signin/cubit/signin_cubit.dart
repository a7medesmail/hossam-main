import 'package:bloc/bloc.dart';
import 'package:graduation_project/business_logic/repo/repository.dart';
import 'package:graduation_project/data/signmodels.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  
  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());
    try {
      final response = await HomeRepo().signin('auth/login', email, password);
      final signmodels = Signmodels.fromJson(response);
      print('Sign-in successful, token: ${signmodels.accessToken}');
      emit(SigninSuccess(signmodels));
    } catch (e) {
      print('Sign-in failed: $e');
      emit(SigninError('Invalid email or password. Please try again.'));
    }
  }
}
