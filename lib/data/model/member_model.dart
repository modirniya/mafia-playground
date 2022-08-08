import 'dart:convert' as member_model;

/// uuid : "4ecbcd5a-2357-461b-a5ef-5fbfb54cf437"

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(member_model.json.decode(str));

String memberModelToJson(MemberModel data) =>
    member_model.json.encode(data.toJson());

class MemberModel {
  MemberModel({
    String? uuid,
  }) {
    _uuid = uuid;
  }

  MemberModel.fromJson(dynamic json) {
    _uuid = json['uuid'];
  }

  String? _uuid;

  MemberModel copyWith({
    String? uuid,
  }) =>
      MemberModel(
        uuid: uuid ?? _uuid,
      );

  String? get uuid => _uuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    return map;
  }
}
