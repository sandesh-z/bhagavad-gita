import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  var headers = {
    'X-RapidAPI-Key': 'c54f17e36dmshda1f1fded6b6f01p17b842jsn3738b297c33a',
    'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
  };
  var params = {'limit': '18'};
  try {
    final response = await dio.get(
        'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/',
        queryParameters: params,
        options: Options(headers: headers));
    print(response);
  } catch (e) {
    print(e.toString());
  }
}
