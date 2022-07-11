import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'LoginModel.g.dart';

@RestApi(baseUrl: 'http://146.56.160.164:30003/')
abstract class RestClient {
    factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

    @POST('api/user/login')
    Future<LoginModel> postLogin(@Body() EmailPW emailpw);
}

@JsonSerializable()
class EmailPW {
    String? email;
    String? password;

    EmailPW({this.email, this.password});

    factory EmailPW.fromJson(dynamic json) => _$EmailPWFromJson(json);

    Map<String, dynamic> toJson() => _$EmailPWToJson(this);
}


@JsonSerializable()
class LoginModel {
  int? statusCode;
  String? msg;
  Data? data;

  LoginModel({this.statusCode, this.msg, this.data});

  factory LoginModel.fromJson(dynamic json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
@JsonSerializable()
class Data {
  int? userId;
  String? name;
  String? email;
  String? thumbNailImageUrl;
  String? siName;
  String? dongName;
  double? mannerDegree;
  String? phoneNumber;
  String? accessToken;

  Data(
      {this.userId,
        this.name,
        this.email,
        this.thumbNailImageUrl,
        this.siName,
        this.dongName,
        this.mannerDegree,
        this.phoneNumber,
        this.accessToken});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}