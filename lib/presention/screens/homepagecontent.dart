// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:graduation_project/presention/screens/upload.dart';

class HomePageContent extends StatelessWidget {
  final String accessToken;
  final List<String> imageUrls = [
    'https://www.uab.edu/news/images/2018/Breast_cancer_Month.png',
    'https://static.euronews.com/articles/stories/07/64/91/80/1200x675_cmsv2_81da5980-bc5e-5def-bdf0-005225bdfc61-7649180.jpg',
    'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2020/8/shutterstock_47781766.jpg',
  ];

  HomePageContent({
    Key? key,
    required this.accessToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UploadPhotoPage(
                  token: accessToken,
                ),
              ),
            );
          },
          child: _buildImageContainer(imageUrls[index]),
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: 16), // Space between photos
    );
  }

  Widget _buildImageContainer(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9, // Maintain a consistent aspect ratio
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
