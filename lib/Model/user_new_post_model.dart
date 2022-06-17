import 'dart:io';

import 'package:flutter/cupertino.dart';

class UserNewPostModel {
  UserNewPostModel({
    required this.file,
    required this.category,
    required this.reportto,
    required this.description,
    required this.location,
    required this.userName,
    required this.cityName,
    required this.fileType,
  });
  late final String? file;
  late final String? category;
  late final String? reportto;
  late final String? description;
  late final String? location;
  late final String? userName;
  late final String? cityName;
  late final String? fileType;

  UserNewPostModel.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    category = json['category'];
    reportto = json['reportto'];
    description = json['description'];
    location = json['location'];
    userName = json['userName'];
    cityName = json['cityName'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['file'] = file;
    _data['category'] = category;
    _data['reportto'] = reportto;
    _data['description'] = description;
    _data['location'] = location;
    _data['userName'] = userName;
    _data['cityName'] = cityName;
    _data['fileType'] = fileType;
    return _data;
  }
}
