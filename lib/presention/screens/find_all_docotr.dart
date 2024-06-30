import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/business_logic/findalldoctor/cubit/findalldoctor_cubit.dart';

class FindAllDoctor extends StatefulWidget {
  const FindAllDoctor({super.key, required this.accessToken});
  final String accessToken;

  @override
  State<FindAllDoctor> createState() => _FindAllDoctorState();
}

class _FindAllDoctorState extends State<FindAllDoctor> {
  @override
  void initState() {
    super.initState();
    // Assuming you have the token available here, replace 'your_token_here' with the actual token
    final token = widget.accessToken;
    BlocProvider.of<FindalldoctorCubit>(context).findalldoctorss(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find All Doctors'),
      ),
      body: BlocBuilder<FindalldoctorCubit, FindalldoctorState>(
        builder: (context, state) {
          if (state is FindalldoctorLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FindalldoctorSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.doctors.length,
              itemBuilder: (context, index) {
                final doctor = state.doctors[index];
                return ListTile(
                  leading: doctor.image != null
                      ? Image.network(doctor.image!)
                      : null,
                  title: Text(doctor.name ?? 'No Name'),
                  subtitle: Text(doctor.location ?? 'No Location'),
                );
              },
            );
          } else if (state is FindalldoctorError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
