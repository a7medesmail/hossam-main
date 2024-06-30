import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/business_logic/uploadmodels/cubit/braintest_cubit.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoPage extends StatefulWidget {
  final String? token;

  const UploadPhotoPage({Key? key, required this.token}) : super(key: key);

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  XFile? _imageFile;
  String? diagnosisMessage; // State variable to store the success message

  void galleryPicker() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void showResult() async {
    if (_imageFile != null && widget.token != null) {
      MultipartFile file = await MultipartFile.fromFile(_imageFile!.path);
      context.read<BraintestCubit>().uploadBrainTest(
            image: file,
            token: widget.token!,
          );
    } else {
      print("Image or token is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photo'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocBuilder<BraintestCubit, BraintestState>(
        builder: (context, state) {
          if (state is BraintestSuccess) {
           
            diagnosisMessage = state.message.diag; // Store the success message
          } else if (state is BraintestError) {
            diagnosisMessage = null; // Clear the message on error
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: _imageFile != null
                        ? FileImage(File(_imageFile!.path))
                        : null,
                    radius: 100,
                    backgroundColor: const Color(0xff21385A),
                    child: _imageFile == null
                        ? const Icon(Icons.photo_library,
                            size: 125, color: Colors.white)
                        : null,
                  ),
                ],
              ),
              const Spacer(flex: 3),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: galleryPicker,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff21385A),
                      minimumSize: const Size(100, 50),
                    ),
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 170),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: showResult,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff21385A),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text(
                          'Show Result',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      if (diagnosisMessage != null)
                        Text(
                          "Diagnosis: $diagnosisMessage",
                          style: const TextStyle(fontSize: 20),
                        ),
                      if (state is BraintestError)
                        Text(
                          state.error,
                          style: const TextStyle(fontSize: 20, color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
