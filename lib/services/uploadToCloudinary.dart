import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> uploadImageToCloudinary(File imageFile) async {
  final cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'];
  final uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET'];

  if (cloudName == null || uploadPreset == null) {
    print('❌ Missing env variables');
    return null;
  }

  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
  );

  final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = uploadPreset
    ..files.add(
      await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

  try {
    final response = await request.send();
    final resBody = await http.Response.fromStream(response);

    if (resBody.statusCode == 200) {
      final data = json.decode(resBody.body);
      return data['secure_url'];
    } else {
      print('❌ Upload failed: ${resBody.body}');
      return null;
    }
  } catch (e) {
    print('❌ Error: $e');
    return null;
  }
}
