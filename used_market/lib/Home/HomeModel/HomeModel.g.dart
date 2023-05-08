// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSaleParam _$GetSaleParamFromJson(Map<String, dynamic> json) => GetSaleParam(
      user_id: json['user_id'] as String?,
      lon: json['lon'] as String?,
      lat: json['lat'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$GetSaleParamToJson(GetSaleParam instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'lon': instance.lon,
      'lat': instance.lat,
      'start': instance.start,
      'end': instance.end,
    };

SaleItem _$SaleItemFromJson(Map<String, dynamic> json) => SaleItem(
      itemId: json['itemId'] as int?,
      userId: json['userId'] as int?,
      title: json['title'] as String?,
      categoryId: json['categoryId'] as int?,
      description: json['description'] as String?,
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      thumbnailImgUrl: json['thumbnailImgUrl'] as String?,
      itemStatus: json['itemStatus'] as int?,
      price: json['price'] as int?,
      createdAt: json['createdAt'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentInfo: (json['commentInfo'] as List<dynamic>?)
          ?.map((e) => CommentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploaderInfo: json['uploaderInfo'] == null
          ? null
          : UploaderInfo.fromJson(json['uploaderInfo'] as Map<String, dynamic>),
      likeCount: json['likeCount'] as int?,
    );

Map<String, dynamic> _$SaleItemToJson(SaleItem instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'userId': instance.userId,
      'title': instance.title,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'lon': instance.lon,
      'lat': instance.lat,
      'thumbnailImgUrl': instance.thumbnailImgUrl,
      'itemStatus': instance.itemStatus,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'images': instance.images,
      'commentInfo': instance.commentInfo,
      'uploaderInfo': instance.uploaderInfo,
      'likeCount': instance.likeCount,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) => CommentInfo(
      commentId: json['commentId'] as int?,
      userId: json['userId'] as int?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'userId': instance.userId,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
    };

UploaderInfo _$UploaderInfoFromJson(Map<String, dynamic> json) => UploaderInfo(
      userId: json['userId'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      thumbNailImageUrl: json['thumbNailImageUrl'] as String?,
      siName: json['siName'] as String?,
      dongName: json['dongName'] as String?,
      mannerDegree: (json['mannerDegree'] as num?)?.toDouble(),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UploaderInfoToJson(UploaderInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'thumbNailImageUrl': instance.thumbNailImageUrl,
      'siName': instance.siName,
      'dongName': instance.dongName,
      'mannerDegree': instance.mannerDegree,
      'phoneNumber': instance.phoneNumber,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HomeClient implements HomeClient {
  _HomeClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://146.56.160.164:30003/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SaleItem> getSaleItem(getSaleParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(getSaleParam.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SaleItem>(
            Options(method: 'Get', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/post',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SaleItem.fromJson(_result.data!);
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
