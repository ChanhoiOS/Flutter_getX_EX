// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailPW _$EmailPWFromJson(Map<String, dynamic> json) => EmailPW(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$EmailPWToJson(EmailPW instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      statusCode: json['statusCode'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      thumbNailImageUrl: json['thumbNailImageUrl'] as String?,
      siName: json['siName'] as String?,
      dongName: json['dongName'] as String?,
      mannerDegree: (json['mannerDegree'] as num?)?.toDouble(),
      phoneNumber: json['phoneNumber'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'thumbNailImageUrl': instance.thumbNailImageUrl,
      'siName': instance.siName,
      'dongName': instance.dongName,
      'mannerDegree': instance.mannerDegree,
      'phoneNumber': instance.phoneNumber,
      'accessToken': instance.accessToken,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://146.56.160.164:30003/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginModel> postLogin(emailpw) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(emailpw.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/user/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
