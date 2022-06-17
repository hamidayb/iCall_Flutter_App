import 'dart:convert';

UserAllPostsModel postsResponseJson(String str) =>
    UserAllPostsModel.fromJson(json.decode(str));

class UserAllPostsModel {
  UserAllPostsModel({
    required this.id,
    required this.category,
    required this.reportto,
    required this.description,
    required this.location,
    required this.file,
    required this.userId,
    required this.fileType,
    required this.cityName,
    required this.userName,
    required this.timestamp,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String? id;
  late final String? category;
  late final String? reportto;
  late final String? description;
  late final String? location;
  late final String? file;
  late final String? userId;
  late final String? fileType;
  late final String? cityName;
  late final String? userName;
  late final String? timestamp;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? V;

  UserAllPostsModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = json['category'];
    reportto = json['reportto'];
    description = json['description'];
    location = json['location'];
    file = json['file'];
    userId = json['userId'];
    fileType = json['fileType'];
    cityName = json['cityName'];
    userName = json['userName'];
    timestamp = json['timestamp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['category'] = category;
    _data['reportto'] = reportto;
    _data['description'] = description;
    _data['location'] = location;
    _data['file'] = file;
    _data['userId'] = userId;
    _data['fileType'] = fileType;
    _data['cityName'] = cityName;
    _data['userName'] = userName;
    _data['timestamp'] = timestamp;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
