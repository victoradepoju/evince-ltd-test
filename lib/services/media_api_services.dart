import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:task1/constants/constants.dart';
import 'package:task1/services/http_error_handler.dart';
import 'package:dio/dio.dart';

class MediaApiServices {
  Future<List> getMediaList() async {
    try {
      final response = await http.get(Uri.parse(kHost));

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final mediaListJson = json.decode(response.body);

      return mediaListJson;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> downloadAudio(String url, fileName) async {
    var dio = Dio();
    Directory directory = await getApplicationDocumentsDirectory();

    var response = await dio.download(url, '${directory.path}/$fileName.mp3');
    // print(response.statusCode);
    // print(directory.path);
  }
}
