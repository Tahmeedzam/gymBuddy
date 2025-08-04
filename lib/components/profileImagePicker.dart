import 'package:flutter/material.dart';
import 'package:gymbuddy/providers/userDataProvider.dart';
import 'package:gymbuddy/services/uploadToCloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _imageFile;

  Future<void> _pickAndUploadImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      setState(() {
        _imageFile = file;
      });

      final url = await uploadImageToCloudinary(file);
      if (url != null) {
        final provider = Provider.of<FormDataProvider>(context, listen: false);
        provider.setProfileImageUrl(url); // ✅ Save to Provider
        print('✅ Uploaded and saved: $url');
      } else {
        print('❌ Upload failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickAndUploadImage,
      child: Container(
        height: 141,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: _imageFile == null
            ? const Center(child: Icon(Icons.person_add_alt_1_sharp, size: 72))
            : Image.file(_imageFile!, fit: BoxFit.cover),
      ),
    );
  }
}
