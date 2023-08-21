import 'package:dio/dio.dart';

class NewsClient {
  final Dio dio = Dio();
  getNewsDataFromAPI() async {
    String newsURL =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=1e72552bd2424253b233accda8660b95';
    try {
      var response = await dio.get(newsURL);
      return response.data;
    } catch (error) {
      return "error is fetching data from API";
    }
  }
}
