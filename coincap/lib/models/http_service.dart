import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'app_config.dart';

class HttpService {

  final Dio dio = Dio();

  late AppConfig _appConfig;
  late String _baseURL;

  HttpService() {

    // reference to the singleton instance of AppConfig class created at startup
    _appConfig = GetIt.instance.get<AppConfig>();
    _baseURL = _appConfig.COIN_API_BASE_URL;
  }

  Future<Response?> get(String path) async {
    try {
      String url = "$_baseURL$path";
      Response response = await dio.get(url);
      return response;
    } on DioError catch(e) {
      return e.response;
    } catch (e) {
      return null;
    }
  }
}