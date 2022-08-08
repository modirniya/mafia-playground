import 'package:http/http.dart' as http;
import 'package:mafia_playground/core/constant/uri.dart';
import 'package:mafia_playground/core/error/exceptions.dart';

import '../../core/constant/objects.dart';
import '../model/header_body_container.dart';
import '../model/member_model.dart';

class MemberFirebaseFunction {
  late final http.Client? client;

  late final Uri? _uri;

  MemberFirebaseFunction(
      {required this.client, required FunctionAccessPoint host}) {
    switch (host) {
      case FunctionAccessPoint.usCentral:
        _uri = uriMemberFunctionUsCentral;
        break;
      default:
        _uri = uriMemberFunctionsEmulator;
    }
  }

  Future<MemberModel> get({required HeadersBodyContainer container}) async {
    var response = await client?.get(_uri!, headers: container.headers).timeout(const Duration(seconds: 4));
    if (response?.statusCode == 200) {
      return memberModelFromJson(response!.body);
    }
    throw ServerException();
  }
}
