import 'dart:convert';

/// language : "FA"
/// name : "Parham"
/// region : "IR"

ProfileModel profileMemberFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileMemberToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    String? language,
    String? name,
    String? region,
  }) {
    _language = language;
    _name = name;
    _region = region;
  }

  ProfileModel.fromJson(dynamic json) {
    _language = json['language'];
    _name = json['name'];
    _region = json['region'];
  }

  String? _language;
  String? _name;
  String? _region;

  ProfileModel copyWith({
    String? language,
    String? name,
    String? region,
  }) =>
      ProfileModel(
        language: language ?? _language,
        name: name ?? _name,
        region: region ?? _region,
      );

  String? get language => _language;

  String? get name => _name;

  String? get region => _region;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = _language;
    map['name'] = _name;
    map['region'] = _region;
    return map;
  }
}
