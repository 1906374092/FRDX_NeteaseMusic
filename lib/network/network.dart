import 'package:dio/dio.dart';
import 'package:zmusic_flutter/config/config.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';

class HttpManager {
  static HttpManager _manager;
  HttpManager._();

  Dio _dio;
  static HttpManager getInstance() {
    if (_manager == null) {
      _manager = HttpManager._();
      _manager._configDio();
    }
    return _manager;
  }

  _configDio() {
    _dio = Dio();
    _dio.options.baseUrl = Config.DEBUG
        ? "http://192.168.1.106:3000"
        : "http://154.8.229.215:8002";
    _dio.options.connectTimeout = 60000;
    _dio.options.receiveTimeout = 60000;
    _dio.interceptors.add(CustomInterceptors());
  }

  dynamic post(String path, {Object params}) async {
    try {
      Response<Map> response = await _dio.post(
        path,
        data: params,
      );
      return response.data;
    } on DioError catch (e) {
      return null;
    }
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    ///登录状态请求携带cookie信息
    if (ApplicationManager.sharedInstance().loginInfo != null) {
      options.headers["cookie"] =
          ApplicationManager.sharedInstance().loginInfo.cookie;
    }
    // print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // print(
    //     "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    ApplicationManager.logger.e(
        "ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
