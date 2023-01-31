import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

upload(String filePath) async {
  var uri = Uri.parse("https://example.com/upload");

  http.MultipartRequest("POST", uri);

  var request = http.MultipartRequest('POST', uri);
  request.fields['user'] = "test@test.com";
  request.fields['id'] = "100";

  final http.MultipartFile passportFile = await http.MultipartFile.fromPath(
    "passport",
    filePath,
  );

  request.files.add(passportFile);

  var response = await request.send();
  if (response.statusCode == 200) print('Uploaded!');
}
