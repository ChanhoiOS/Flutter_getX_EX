import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'HomeModel.g.dart';

@RestApi(baseUrl: 'http://146.56.160.164:30003/')
abstract class HomeClient {
    factory HomeClient(Dio dio, {String baseUrl}) = _HomeClient;

    @POST('api/post')
    Future<SaleItem> getSaleItem(@Body() GetSaleParam getSaleParam);
}

@JsonSerializable()
class GetSaleParam {
  String? user_id;
  String? lon;
  String? lat;
  String? start;
  String? end;

  GetSaleParam({this.user_id, this.lon, this.lat, this.start, this.end});

  factory GetSaleParam.fromJson(dynamic json) => _$GetSaleParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetSaleParamToJson(this);
}

@JsonSerializable()
class SaleItem {
  int? itemId;
  int? userId;
  String? title;
  int? categoryId;
  String? description;
  double? lon;
  double? lat;
  String? thumbnailImgUrl;
  int? itemStatus;
  int? price;
  String? createdAt;
  List<Images>? images;
  List<CommentInfo>? commentInfo;
  UploaderInfo? uploaderInfo;
  int? likeCount;

  SaleItem(
      {this.itemId,
        this.userId,
        this.title,
        this.categoryId,
        this.description,
        this.lon,
        this.lat,
        this.thumbnailImgUrl,
        this.itemStatus,
        this.price,
        this.createdAt,
        this.images,
        this.commentInfo,
        this.uploaderInfo,
        this.likeCount});

  SaleItem.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    userId = json['userId'];
    title = json['title'];
    categoryId = json['categoryId'];
    description = json['description'];
    lon = json['lon'];
    lat = json['lat'];
    thumbnailImgUrl = json['thumbnailImgUrl'];
    itemStatus = json['itemStatus'];
    price = json['price'];
    createdAt = json['createdAt'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['commentInfo'] != null) {
      commentInfo = <CommentInfo>[];
      json['commentInfo'].forEach((v) {
        commentInfo!.add(new CommentInfo.fromJson(v));
      });
    }
    uploaderInfo = json['uploaderInfo'] != null
        ? new UploaderInfo.fromJson(json['uploaderInfo'])
        : null;
    likeCount = json['likeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['categoryId'] = this.categoryId;
    data['description'] = this.description;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['thumbnailImgUrl'] = this.thumbnailImgUrl;
    data['itemStatus'] = this.itemStatus;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.commentInfo != null) {
      data['commentInfo'] = this.commentInfo!.map((v) => v.toJson()).toList();
    }
    if (this.uploaderInfo != null) {
      data['uploaderInfo'] = this.uploaderInfo!.toJson();
    }
    data['likeCount'] = this.likeCount;
    return data;
  }
}

@JsonSerializable()
class Images {
  String? imageUrl;

  Images({this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

@JsonSerializable()
class CommentInfo {
  int? commentId;
  int? userId;
  String? comment;
  String? createdAt;

  CommentInfo({this.commentId, this.userId, this.comment, this.createdAt});

  CommentInfo.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['userId'] = this.userId;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

@JsonSerializable()
class UploaderInfo {
  int? userId;
  String? name;
  String? email;
  String? thumbNailImageUrl;
  String? siName;
  String? dongName;
  double? mannerDegree;
  String? phoneNumber;

  UploaderInfo(
      {this.userId,
        this.name,
        this.email,
        this.thumbNailImageUrl,
        this.siName,
        this.dongName,
        this.mannerDegree,
        this.phoneNumber});

  UploaderInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    thumbNailImageUrl = json['thumbNailImageUrl'];
    siName = json['siName'];
    dongName = json['dongName'];
    mannerDegree = json['mannerDegree'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['thumbNailImageUrl'] = this.thumbNailImageUrl;
    data['siName'] = this.siName;
    data['dongName'] = this.dongName;
    data['mannerDegree'] = this.mannerDegree;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

