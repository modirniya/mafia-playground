import 'package:http/http.dart' as http;
import 'package:mafia_playground/core/error/exceptions.dart';
import 'package:mafia_playground/data/model/header_body_container.dart';

import '../../core/constant/objects.dart';
import '../../core/constant/uri.dart';
import '../model/profile_model.dart';

class ProfileFirebaseFunction {
  late final http.Client? client;

  late final Uri? _uri;

  ProfileFirebaseFunction(
      {required this.client, required FunctionAccessPoint host}) {
    switch (host) {
      case FunctionAccessPoint.usCentral:
        _uri = uriProfileFunctionUsCentral;
        break;
      default:
        _uri = uriProfileFunctionsEmulator;
    }
  }

  Future<ProfileModel> get(
      {required HeadersBodyContainer container}) async {
    final response = await client?.get(_uri!, headers: container.headers);
    if (response?.statusCode == 200) {
      return profileMemberFromJson(response!.body);
    } else if (response?.statusCode == 404) {
      throw ServiceNotFoundException();
    }
    throw ServerException();
  }

  Future<ProfileModel> post(
      {required HeadersBodyContainer container}) async {
    final response = await client?.post(_uri!,
        headers: container.headers, body: container.body);
    if (response?.statusCode == 201) {
      return profileMemberFromJson(response!.body);
    }
    throw ServerException();
  }
}
