import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:used_market/Home/HomeModel/HomeModel.dart';
import 'package:used_market/Login/LoginModel/LoginModel.dart';
// import 'package:getx_flutter_basic/core/network/api_client.dart';
// import 'package:getx_flutter_basic/core/network/dio_configuration.dart';

GetIt locator = GetIt.instance;
enum ResourceType { gzipApplied, noGzipApplied }

class DioConfig {
  static Dio getDio(ResourceType resourceType) {
    final dio = Dio(BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 100000,
      headers: getHeader(resourceType),
    ));

    dio.interceptors.add(InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // if(response.data is String) {
          //   response.data = json.decode(EncryptUtil.getInstance.decrypt(response.data));
          //   handler.next(response);
          // } else {
          //   handler.next(response);
          // }
          handler.next(response);
        }));

    return dio;
  }

  static Map<String, String> getHeader(ResourceType resourceType) {
    switch (resourceType) {
      case ResourceType.noGzipApplied:
        return getDioHeaders();
      case ResourceType.gzipApplied:
      default:
        return getDioHeaders();
    }
  }

  static Map<String, String> getDioHeaders() {
    return {
      "Content-Type": "application/json",
      // "Accept": "application/json",
    };
  }

  static Map<String, String> getGzipAppliedHeaders() {
    return {
      "Content-Type": "application/json",
      // "Accept": "application/json",
      // "Content-Encoding": "gzip"
    };
  }
}


void setupLocator() {
  //Singleton
  locator.registerSingleton<Dio>(DioConfig.getDio(ResourceType.noGzipApplied),
      instanceName: ResourceType.noGzipApplied.toString());
  locator.registerSingleton<Dio>(DioConfig.getDio(ResourceType.gzipApplied),
      instanceName: ResourceType.gzipApplied.toString());
  locator.registerSingleton<RestClient>(RestClient(
      locator<Dio>(instanceName: ResourceType.noGzipApplied.toString())));
  locator.registerSingleton<HomeClient>(HomeClient(
      locator<Dio>(instanceName: ResourceType.noGzipApplied.toString())));
}