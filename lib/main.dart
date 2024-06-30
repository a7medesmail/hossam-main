import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/business_logic/findalldoctor/cubit/findalldoctor_cubit.dart';
import 'package:graduation_project/business_logic/signin/cubit/signin_cubit.dart';
import 'package:graduation_project/business_logic/uploadmodels/cubit/braintest_cubit.dart';
import 'package:graduation_project/presention/screens/sign_in.dart';

void main() {
  runApp(MidiqApp());
}

class MidiqApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) =>  FindalldoctorCubit()),
          BlocProvider(create: (context) => SigninCubit()),
          BlocProvider(create: (context) => BraintestCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MidiqHomePage(),
        ));
  }
}
