import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

//...
Future<Map<String, dynamic>> getPosts(String assetsPath) async {
  print('--- Parse json from: $assetsPath');
  return rootBundle.loadString(assetsPath).then((jsonStr) => jsonDecode(jsonStr));
}
